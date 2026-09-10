> [Inicio](README) › [Anexos](08-anexos/README) › **FAQ**

# Preguntas frecuentes

### ¿AI-DLC reemplaza a mi equipo?

No. Reemplaza la *ejecución mecánica* (escribir el primer draft de cada artefacto y del código) por agentes con protocolo; el humano decide en cada gate, corrige, y esas correcciones se vuelven reglas. El modelo es "user decides, AI executes" — literal.

### ¿Qué necesito instalar?

Un harness soportado (Claude Code, Kiro IDE/CLI, Codex, Cursor, opencode, Copilot) + **bun** en el PATH de shells no interactivos (`~/.zshenv`/`~/.bashrc`). Luego copiar el `dist/<harness>/` correspondiente al proyecto y correr `/aidlc --doctor`. Modelo recomendado: Claude Opus 4.8.

### ¿Tengo que correr las 33 etapas?

No — corre la rejilla de tu scope: de 33 (enterprise/feature) a 8 (poc). Además el depth calibra el detalle de cada una, y puedes cambiar scope/depth/test-strategy en cualquier gate. El composer puede componer una rejilla a medida.

### ¿Qué pasa si la IA alucina un requisito?

Tres redes: (1) el sensor `claim-sources` exige provenance en los artefactos; (2) el reviewer (advisory en inception) cita findings verbatim en el gate; (3) el humano en el gate — Request Changes abre el loop de revisión. Y si algo se te pasó, el jump backward invalida receipts downstream y re-corre.

### ¿Cómo sé que el código generado cumple los requisitos?

El coverage gate de Build & Test (3.6): cada FR, NFR y AC de tres segmentos debe tener cobertura trazada; el sensor `traceability` valida el grafo elemento a elemento; y la test strategy define el volumen (Minimal = 1 test por requisito + happy-path floor).

### ¿Puede la IA saltarse un gate?

Estructuralmente no: el gate solo abre con `report awaiting-approval`, solo cierra con `approved/rejected` llevando el `--user-input` EXACTO, y el receipt exige HUMAN_TURN del hook. La autonomía (Construction) salta gates *de etapa*, pero halt-and-ask ante fallos y el settle gate del swarm siguen; y jamás infiere autonomía de un "hazlo como recomendado" previo.

### ¿Qué modelo de datos deja en mi repo?

`aidlc/` — la cáscara del workspace: spaces (memoria org/team/project + knowledge + codekb), intents (record con artefactos por fase, audit shards, verification, aidlc-state.md, project-description.json). Commiteado (viaja con el equipo), salvo cursores per-usuario (active-space, active-intent) y runtime local.

### ¿Puedo usar mi propio harness / editor?

Sí — el diseño one-core lo permite: portás la superficie delgada (manifest + orchestrator + adapters) y el engine byte-identical corre igual. Ver "Porting to a New Harness" en la docs del repo.

### ¿Cómo añado mis propias etapas o reglas sin romper el framework?

- Reglas: se escriben solas via learnings ritual → project.md/team.md (o las escribes directo en tu space).
- Checks: sensor manifest + binding al stage (la instalación dos-escrituras del §13).
- Etapas/contribuciones: plugins con su propio ciclo (`/aidlc plugin sync`).
- JAMÁS edites el body de un stage file — la forma compilada divergiría y el drift guard de CI falla.

### ¿Qué pasa si se cae la sesión a mitad de etapa?

Recovery por 5 fuentes (artefactos → diarios → audit → estado → runtime-graph); el breadcrumb PreCompact detecta corrupción; un loop-back logueado-pero-no-saltado se detecta y completa; el estado corrupto se reconstruye desde evidencia. Las Units tienen receipts con Run floors — nada de intentos previos cuenta como trabajo actual.

### ¿Por qué markdown y no una base de datos?

Porque el record ES el deliverable humano-legible: diff-able en git, revisable en PRs, portátil entre harnesses, y parseable por el engine (YAML frontmatter + secciones). La auditoría structured vive al lado (audit shards con eventos formales), no en vez.

### ¿Cuánto cuesta una corrida?

Depende del scope y depth (el skill `aidlc-session-cost` agrega costos por sesión usando model-rates.json). Regla práctica: poc/express son baratos; enterprise completo es una inversión real — por eso existe la confirmación de scope y el composer (no pagar etapas que el intent no necesita).
