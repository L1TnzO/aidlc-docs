> [Inicio](README) › [Fases](01-fases/README) › [Fase 1 · Ideation](01-fases/fase-1-ideacion) › **Feasibility & Constraint Analysis**


# 1.3 · Feasibility & Constraint Analysis

**CONDITIONAL** · **Fase 1 · Ideation** · Lead **architect** · Modo **inline**

> Condición: Execute when there are integration constraints, regulatory requirements, or significant technical uncertainty. Skip for trivial changes with no technical risk.


## Ficha de metadatos

| Campo | Valor |
|---|---|
| Número | **1.3** |
| Fase | Fase 1 · Ideation |
| slug | `feasibility` |
| execution | **CONDITIONAL** |
| lead_agent | `aidlc-architect-agent` |
| support_agents | `aidlc-aws-platform-agent`, `aidlc-compliance-agent` |
| mode (topología) | **inline** |
| summary_confirmation | `required` (checkpoint consolidado obligatorio) |
| sensors | `required-sections`, `upstream-coverage` |
| requires_stage | `intent-capture`, `market-research` |


## Qué hace esta etapa

Etapa CONDITIONAL a cargo del Architect (con soporte de AWS Platform y Compliance como voces inline): evalúa viabilidad técnica, restricciones de integración, regulatorias (PCI, HIPAA, SOC2, data residency) y riesgos del proyecto. Produce la evaluación de viabilidad, el registro de restricciones y el RAID log. Es la primera etapa multi-agente del ciclo, el ensemble aquí es inline (voces en la misma sesión).

- Trigger: integraciones, regulación o incertidumbre técnica significativa. Se salta en cambios triviales.
- El constraint-register será consumido por Scope Definition (1.4) y por NFR Requirements (3.2).

## Posición en el flujo

```mermaid
flowchart LR
    PREV["1.2 · Market Research"] --> SELF["1.3 · Feasibility & Constraint Analysis"]
    SELF --> NEXT["1.4 · Scope Definition"]
    SELF -. "self-skip si no aplica" .- SKIP["Saltada [S]"]
```
*Posición dentro de Fase 1 · Ideation: 3 de 7.*

**Anterior:** [1.2 · Market Research](02-etapas/ideation/market-research) · **Siguiente:** [1.4 · Scope Definition](02-etapas/ideation/scope-definition)

## Paso a paso

**Step 1: Load Prior Context**: Lee intent-statement y market-research si existe.

**Step 2: Generate Clarifying Questions**: Integraciones existentes, requisitos regulatorios, incertidumbre técnica, restricciones de presupuesto/plazo.

**Step 3: Collect and Analyze Answers**: Análisis de ambigüedad obligatorio.

**Step 4: Generate Artifacts**: feasibility-assessment.md, constraint-register.md, raid-log.md (Risks, Assumptions, Issues, Dependencies).

**Step 5: Completion Handoff**: Learnings ritual.

**Step 6: Present Completion & Request Approval**: Gate estándar.


## Artefactos

```mermaid
flowchart LR
    c0["intent-statement"]
    c1["competitive-analysis"]
    c2["market-trends"]
    c3["build-vs-buy"]
    ST(("1.3"))
    c0 --> ST
    c1 --> ST
    c2 --> ST
    c3 --> ST
    p0["feasibility-assessment"]
    ST --> p0
    p1["constraint-register"]
    ST --> p1
    p2["raid-log"]
    ST --> p2
    p3["feasibility-questions"]
    ST --> p3
```

| Dirección | Artefactos |
|---|---|
| **produce** | `feasibility-assessment`, `constraint-register`, `raid-log`, `feasibility-questions` |
| **consume** | `intent-statement`, `competitive-analysis`, `market-trends`, `build-vs-buy` |

## Agentes implicados

- **Lead:** [aidlc-architect-agent](03-agentes/aidlc-architect-agent), posee los artefactos `produces[]` de la etapa.
- **Soporte:** [aidlc-aws-platform-agent](03-agentes/aidlc-aws-platform-agent), voz inline en la sesión
- **Soporte:** [aidlc-compliance-agent](03-agentes/aidlc-compliance-agent), voz inline en la sesión
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

**Ejecutan esta etapa:** `enterprise`, `feature`, `mvp`

**La saltan:** `bugfix`, `classic`, `express`, `infra`, `poc`, `refactor`, `security-patch`, `workshop`

Cada scope es una rejilla EXECUTE/SKIP sobre las 33 etapas. Ver [la matriz completa de scopes](05-scopes/README).

## Conexiones

- [Ficha de la Fase 1 · Ideation](01-fases/fase-1-ideacion)
- [Etapa anterior: 1.2](02-etapas/ideation/market-research)
- [Etapa siguiente: 1.4](02-etapas/ideation/scope-definition)
- [Ficha del lead: aidlc-architect-agent](03-agentes/aidlc-architect-agent)
- [Protocolos que gobiernan la etapa](04-protocolos/README)
