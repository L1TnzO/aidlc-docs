> [Inicio](README) › [Fases](01-fases/README) › [Fase 1 · Ideation](01-fases/fase-1-ideacion) › **Team Formation**


# 1.5 · Team Formation

**CONDITIONAL** · **Fase 1 · Ideation** · Lead **delivery** · Modo **inline**

> Condición: Execute when team composition, capacity, or mob planning is relevant. Skip for solo developer or small team projects.


## Ficha de metadatos

| Campo | Valor |
|---|---|
| Número | **1.5** |
| Fase | Fase 1 · Ideation |
| slug | `team-formation` |
| execution | **CONDITIONAL** |
| lead_agent | `aidlc-delivery-agent` |
| mode (topología) | **inline** |
| summary_confirmation | `required` (checkpoint consolidado obligatorio) |
| sensors | `required-sections`, `upstream-coverage` |
| requires_stage | `scope-definition` |


## Qué hace esta etapa

Etapa CONDITIONAL dirigida por el Delivery Agent: define composición de equipos, matriz de habilidades, mobs y rutas de escalación, cuando el trabajo lo justifica. En proyectos de developer único o equipos pequeños se salta. Produce team-assessment, skill-matrix y mob-composition. Delivery Planning (2.9) referenciará estos equipos si 1.5 corrió (enterprise, feature); si no, declara que todos los Bolts los ejecuta el AI.

- Trigger: composición de equipo, capacidad o plan de mobs relevante. Skip: dev único o equipo pequeño.

## Posición en el flujo

```mermaid
flowchart LR
    PREV["1.4 · Scope Definition"] --> SELF["1.5 · Team Formation"]
    SELF --> NEXT["1.6 · Rough Mockups"]
    SELF -. "self-skip si no aplica" .- SKIP["Saltada [S]"]
```
*Posición dentro de Fase 1 · Ideation: 5 de 7.*

**Anterior:** [1.4 · Scope Definition](02-etapas/ideation/scope-definition) · **Siguiente:** [1.6 · Rough Mockups](02-etapas/ideation/rough-mockups)

## Paso a paso

**Step 1: Load Prior Context**: Lee scope-definition y feasibility si existen.

**Step 2: Generate Clarifying Questions**: Equipos y personas disponibles, capacidad actual, gaps de habilidad, rotaciones.

**Step 3: Collect and Analyze Answers**: Protocolo estándar.

**Step 4: Generate Artifacts**: team-assessment.md, skill-matrix.md, mob-composition.md (driver/navigator/researcher).

**Step 5: Completion Handoff**: Learnings ritual.

**Step 6: Present Completion & Request Approval**: Gate estándar.


## Artefactos

```mermaid
flowchart LR
    c0["scope-document"]
    c1["intent-backlog"]
    c2["feasibility-assessment"]
    ST(("1.5"))
    c0 --> ST
    c1 --> ST
    c2 --> ST
    p0["team-assessment"]
    ST --> p0
    p1["skill-matrix"]
    ST --> p1
    p2["mob-composition"]
    ST --> p2
    p3["team-formation-questions"]
    ST --> p3
```

| Dirección | Artefactos |
|---|---|
| **produce** | `team-assessment`, `skill-matrix`, `mob-composition`, `team-formation-questions` |
| **consume** | `scope-document`, `intent-backlog`, `feasibility-assessment` |

## Agentes implicados

- **Lead:** [aidlc-delivery-agent](03-agentes/aidlc-delivery-agent), posee los artefactos `produces[]` de la etapa.
- **Conductor:** el orquestador es el bus: los agentes NUNCA se invocan entre sí, solo el conductor delega. Ver [el oficio del conductor](06-maquinaria/conductor).

## Topología y ejecución

**Inline.** El lead corre en la propia sesión del conductor, cargando su persona; los supports (si los hay) son voces que el conductor adopta. Sin contribution files. 29 de las 33 etapas usan esta topología.

## Mecánica del gate

Sin reviewer declarado, el gate es directo:

```mermaid
flowchart LR
    B["Cuerpo de la etapa"] --> LEA["Learnings ritual (pregunta propia)"]
    LEA --> GA["awaiting-approval [?]"]
    GA -->|"Approve"| OK["[x] + auto-advance"]
    GA -->|"Request Changes"| RC["[R] revising"]
    RC -.->|"revised"| GA
```

Reglas de oro: HARD STOP (el conductor termina su turno y espera al humano), NO EMERGENT BEHAVIOR (menús de 2 opciones en Construction/Operation; 3ª opción solo en ideation/inception para recuperar etapas saltadas), y tras 3 ciclos de Request Changes aparece **Accept as-is** (escape hatch). Detalle completo en [ciclo de gate](06-maquinaria/ciclo-de-gate).

## Sensores declarados

| Sensor | dispara en | categoría | qué verifica |
|---|---|---|---|
| `required-sections` | gate | document-shape | Chequea que el output contenga los encabezados H2 requeridos (default: ≥2 H2) o los del template resuelto. |
| `upstream-coverage` | gate | document-shape | Compara la prosa del output con el `consumes:` declarado: cada artefacto upstream debe aparecer referenciado. |

Un sensor `fire_on: gate` corre al entrar el gate; `advisory` solo emite findings; un sensor **blocking** exige pass verificado (o el override respaldado por humano) antes de abrir la gate. Detalle en [sensores](06-maquinaria/sensores).

## En qué scopes ejecuta

**Ejecutan esta etapa:** `enterprise`, `feature`

**La saltan:** `bugfix`, `classic`, `express`, `infra`, `mvp`, `poc`, `refactor`, `security-patch`, `workshop`

Cada scope es una rejilla EXECUTE/SKIP sobre las 33 etapas. Ver [la matriz completa de scopes](05-scopes/README).

## Conexiones

- [Ficha de la Fase 1 · Ideation](01-fases/fase-1-ideacion)
- [Etapa anterior: 1.4](02-etapas/ideation/scope-definition)
- [Etapa siguiente: 1.6](02-etapas/ideation/rough-mockups)
- [Ficha del lead: aidlc-delivery-agent](03-agentes/aidlc-delivery-agent)
- [Protocolos que gobiernan la etapa](04-protocolos/README)
