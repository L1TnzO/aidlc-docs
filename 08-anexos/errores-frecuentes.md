> [Inicio](README) › [Anexos](08-anexos/README) › **Errores frecuentes**

# Errores frecuentes y su fix

Del troubleshooting oficial del repo más los tropiezos estructurales que el protocolo previene. Ordenados por categoría.

## Instalación y arranque

| Síntoma | Causa | Fix |
|---|---|---|
| `which bun` funciona en tu terminal pero el harness no encuentra bun | bun está en el PATH interactivo, no en el no-interactivo (el que usan hooks/tools) | Copiar el export `BUN_INSTALL`/`PATH` a `~/.zshenv` (zsh) o `~/.bashrc` (bash/Git Bash) |
| `/aidlc --doctor` reporta Codex < 0.145.0 | Versión vieja de Codex CLI | Actualizar a ≥ 0.145.0 (versiones viejas retrasan la restauración de contexto post-compaction) |
| Bedrock falla con `AccessDenied` o model-not-found | Modelos no habilitados / credenciales / región | Habilitar los modelos del harness en la cuenta AWS, credenciales en la SDK chain, `AWS_REGION` correcta |
| Los hooks nunca disparan (sin audit rows, sin gates) — Codex | Hooks sin trust | `bun scripts/package.ts codex trust --project <dir>` o "Trust all" en una sesión TUI; los untrusted JAMÁS corren |
| Copilot: hooks no corren | Folder sin trust + headless | Agregar el path a `trustedFolders` en `~/.copilot/config.json`; headless necesita `GITHUB_COPILOT_PROMPT_MODE_REPO_HOOKS=1` |
| Stages/contribuciones de plugin desaparecen tras copiar un dist nuevo | El engine stock reemplaza el grafo | Re-correr `/aidlc plugin sync` (o dejar que el compose-capable host se auto-cure al siguiente session start) |
| Skills/rules no aplican tras actualizar | Se cargan al inicio de sesión | Iniciar sesión nueva |
| Workspace shell check falla | Falta la cáscara `aidlc/` hermana | Copiar `dist/<harness>/aidlc/` al proyecto (sibling del dir nativo, NO dentro) |

## Durante el workflow

| Síntoma | Causa | Fix |
|---|---|---|
| "Module not found" al correr tools tras un `cd` | CWD drift: paths relativos rotos | Usar paths absolutos a tools o subshells: `(cd subdir && cmd)` |
| El conductor se "olvida" de la etapa a mitad | Context compaction | El PreCompact validó y dejó breadcrumb; reanudar — recovery re-orienta desde las 5 fuentes |
| El stage salta pasos que considero obligatorios | Modelo débil | Modelo recomendado: Claude Opus 4.8 — en modelos menores el conductor puede saltarse pasos opcionales |
| Preguntas repetidas entre etapas | — | El protocolo lo prohíbe (chequeo recursivo); si ocurre: reportar — el learnings ritual debería convertir tu corrección en regla |
| Un gate no abre tras el review | Receipt review pendiente o sensor blocking | Esperar el `REVIEW_COMPLETED` fresco; si hay findings blocking: Fix findings (el override es humano-backed) |
| El reviewer "no ve" una integración entre unidades | Read-scope per-unit | Diseño intencional: solo spot-check del archivo dueño nombrado explícitamente en el design de la Unit |
| Writes al artefacto rechazados tras un READY | Review freeze | Diseño intencional: el receipt terminal protege lo revisado; si hay que cambiar, Request Changes resetea el intento |

## Estado y reanudación

| Síntoma | Causa | Fix |
|---|---|---|
| `aidlc-state.md` corrupto tras compaction/crash | Escritura parcial | Recovery: backup + reconstrucción desde evidencia de artefactos; el breadcrumb confirma |
| El contador de loop-back "volvió a cero" | — | No debería: el contador ES el conteo del ledger en test-results.md, nunca cero en resume |
| Worktrees huérfanos bloquean un nuevo swarm | Crash/halt mid-swarm | Descartar worktrees/branches stale ANTES de `prepare` — jamás adoptarlos |
| Un Unit pausada hard-stopea el flujo | `unit pause` pendiente | Diseño intencional: resolver la razón o `unit resume` explícito |

## Anti-patrones de uso (humanos)

- **Aprobar sin leer el summary**: el completion message trae la tabla de artefactos precisamente para decidir rápido pero informado.
- **Responder fuera de las opciones**: se cita tu respuesta y se re-presenta el menú — nada se pierde, pero el flujo espera una elección semántica.
- **"Hazlo como recomendado" como regla permanente**: la autonomía es por-ETAPA y explícita; si quieres autonomía, el ladder del walking skeleton es el camino.
- **Editar `dist/` o stage files a mano**: drift guard / inmutabilidad — los learnings y plugins son los seams sancionados.
- **Tratar el contrato de testing como sugerencia**: los floors no se debilitan para que un step pase (regla del protocolo).

## Diagnóstico rápido

```bash
/aidlc --doctor                    # chequeo completo del setup
/aidlc --status                    # dónde está el workflow ahora
bun .claude/tools/aidlc-state.ts lookup phase-of <slug>   # fase de una etapa
bun .claude/tools/aidlc-state.ts lookup next-stage <slug> <scope>
```
