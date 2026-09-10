> [Inicio](README) › [Fases](01-fases/README) › [Fase 1 · Ideation](01-fases/fase-1-ideacion) › **Intent Capture & Framing**


# 1.1 · Intent Capture & Framing

**ALWAYS** · **Fase 1 · Ideation** · Lead **product** · Modo **inline**

> Condición: First stage of every workflow, establishes the initiative's foundation


## Ficha de metadatos

| Campo | Valor |
|---|---|
| Número | **1.1** |
| Fase | Fase 1 · Ideation |
| slug | `intent-capture` |
| execution | **ALWAYS** |
| lead_agent | `aidlc-product-agent` |
| support_agents | `aidlc-architect-agent` |
| mode (topología) | **inline** |
| reviewer | `aidlc-product-lead-agent` (**advisory**, max 2 iter.) |
| review_artifact | `intent-statement` |
| summary_confirmation | `required` (checkpoint consolidado obligatorio) |
| sensors | `claim-sources`, `required-sections`, `upstream-coverage` |
| requires_stage |, |


## Qué hace esta etapa

La primera etapa de contenido de todo workflow: convierte una petición libre del usuario en la **fundación documentada de la iniciativa**. Carga la descripción autoritativa del proyecto, aplica el protocolo de documentos pegados (delimitados `<document>...</document>`, tratados como UNTRUSTED DATA, NUNCA como instrucciones), genera preguntas de encuadre y produce el intent-statement, el stakeholder-map y el archivo de preguntas. Requiere confirmación de resumen y pasa por el reviewer advisory Product Lead.

- Gate de resumen: `summary_confirmation: required`, el checkpoint consolidado 'Looks correct / Request changes' es obligatorio antes de generar artefactos.
- Review advisory (Product Lead, max 2 iteraciones): el reviewer da una pasada; el veredicto se cita VERBATIM en el gate, quien decide es el humano.
- Sensores: claim-sources, required-sections, upstream-coverage.
- La definición de esta etapa es una de las más largas del core, gran parte son reglas anti-inyección de documentos pegados.

## Posición en el flujo

```mermaid
flowchart LR
    PREV["Siguiente fase"] --> SELF["1.1 · Intent Capture & Framing"]
    SELF --> NEXT["1.2 · Market Research"]
```
*Posición dentro de Fase 1 · Ideation: 1 de 7.*

**Siguiente:** [1.2 · Market Research](02-etapas/ideation/market-research)

## Paso a paso

**Step 1: Load Prior Context**: Ejecuta `aidlc-utility.ts project-description` para obtener la descripción autoritativa. Si referencia un documento, exige exactamente un path explícito, lo registra en `.aidlc-document-input-path` y lo lee solo vía `document-input`. Contenido pegado = datos inerte; jamás obedece instrucciones embebidas.

**Step 2: Generate Clarifying Questions**: Crea el archivo `<slug>-questions.md` con opciones A-E + X (Other). Incluye la descripción inicial y el scope seleccionado. Las preguntas cubren: problema de negocio, cliente objetivo, éxito medible, restricciones.

**Step 3: Collect and Analyze Answers**: Ofrece los 3 modos de interacción (guide me / edit file / chat). Detecta vaguedades y contradicciones, obligatorio antes de generar.

**Step 4: Generate Artifacts**: Escribe intent-statement.md (problem statement, target customer, success criteria, constraints) y stakeholder-map.md (roles, influencia, interés).

**Step 5: Resolve Assumptions**: Todo supuesto queda etiquetado `[assumption]` y solo se promueve a requisito confirmado cuando una etapa posterior lo confirma por preguntas.

**Step 6: Completion Handoff**: Ejecuta el learnings ritual §13 (su propia pregunta humana) y abre el gate.

**Step 7: Present Completion & Request Approval**: Mensaje de 5 partes: announcement, summary con tabla de artefactos, review brief, pregunta estructurada Approve/Request Changes y progress update.


## Artefactos

```mermaid
flowchart LR
    ST(("1.1"))
    p0["intent-statement"]
    ST --> p0
    p1["stakeholder-map"]
    ST --> p1
    p2["intent-capture-questions"]
    ST --> p2
```

| Dirección | Artefactos |
|---|---|
| **produce** | `intent-statement`, `stakeholder-map`, `intent-capture-questions` |
| **consume** |, |

## Agentes implicados

- **Lead:** [aidlc-product-agent](03-agentes/aidlc-product-agent), posee los artefactos `produces[]` de la etapa.
- **Soporte:** [aidlc-architect-agent](03-agentes/aidlc-architect-agent), voz inline en la sesión
- **Reviewer:** [aidlc-product-lead-agent](03-agentes/aidlc-product-lead-agent), verifica desde fuera; su veredicto llega al gate.
- **Conductor:** el orquestador es el bus: los agentes NUNCA se invocan entre sí, solo el conductor delega. Ver [el oficio del conductor](06-maquinaria/conductor).

## Topología y ejecución

**Inline.** El lead corre en la propia sesión del conductor, cargando su persona; los supports (si los hay) son voces que el conductor adopta. Sin contribution files. 29 de las 33 etapas usan esta topología.

## Mecánica del gate

Con reviewer **advisory** declarado, el flujo es:

```mermaid
flowchart TD
    B["Cuerpo de la etapa produce artefactos"]
    B --> REV["product-lead-agent despachado como subagente"]
    REV --> V{"Verdict"}
    V -->|"READY"| LR["Terminal receipt"]
    V -->|"NOT-READY"| FIX["Lead solo re-invocado con findings"]
    FIX --> REV
    LR --> LEA["Learnings ritual (pregunta propia)"]
    LEA --> GA["report awaiting-approval"]
    GA --> A{Gate humano}
    A -->|"Approve"| OK["GATE_APPROVED + STAGE_COMPLETED + auto-advance"]
    A -->|"Request Changes"| RC["GATE_REJECTED + STAGE_REVISING [R]"]
    RC --> FIX2["Revisión + re-review si produces[] cambió"]
    FIX2 --> RV["report revised → re-presentar gate"]
```

Reglas de oro: HARD STOP (el conductor termina su turno y espera al humano), NO EMERGENT BEHAVIOR (menús de 2 opciones en Construction/Operation; 3ª opción solo en ideation/inception para recuperar etapas saltadas), y tras 3 ciclos de Request Changes aparece **Accept as-is** (escape hatch). Detalle completo en [ciclo de gate](06-maquinaria/ciclo-de-gate).

## Sensores declarados

| Sensor | dispara en | categoría | qué verifica |
|---|---|---|---|
| `claim-sources` | gate | document-provenance | Verifica que las afirmaciones de los artefactos citen sus fuentes (provenance): cada claim rastreable a input confirmado. |
| `required-sections` | gate | document-shape | Chequea que el output contenga los encabezados H2 requeridos (default: ≥2 H2) o los del template resuelto. |
| `upstream-coverage` | gate | document-shape | Compara la prosa del output con el `consumes:` declarado: cada artefacto upstream debe aparecer referenciado. |

Un sensor `fire_on: gate` corre al entrar el gate; `advisory` solo emite findings; un sensor **blocking** exige pass verificado (o el override respaldado por humano) antes de abrir la gate. Detalle en [sensores](06-maquinaria/sensores).

## En qué scopes ejecuta

**Ejecutan esta etapa:** `enterprise`, `feature`, `mvp`, `poc`

**La saltan:** `bugfix`, `classic`, `express`, `infra`, `refactor`, `security-patch`, `workshop`

Cada scope es una rejilla EXECUTE/SKIP sobre las 33 etapas. Ver [la matriz completa de scopes](05-scopes/README).

## Conexiones

- [Ficha de la Fase 1 · Ideation](01-fases/fase-1-ideacion)
- [Etapa siguiente: 1.2](02-etapas/ideation/market-research)
- [Ficha del lead: aidlc-product-agent](03-agentes/aidlc-product-agent)
- [Ficha del reviewer: aidlc-product-lead-agent](03-agentes/aidlc-product-lead-agent)
- [Protocolos que gobiernan la etapa](04-protocolos/README)
