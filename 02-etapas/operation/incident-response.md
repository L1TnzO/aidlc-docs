> [Inicio](README) › [Fases](01-fases/README) › [Fase 4 · Operation](01-fases/fase-4-operacion) › **Incident Response**


# 4.5 · Incident Response

**CONDITIONAL** · **Fase 4 · Operation** · Lead **operations** · Modo **inline**

> Condición: Execute when operational runbooks and incident response procedures are needed


## Ficha de metadatos

| Campo | Valor |
|---|---|
| Número | **4.5** |
| Fase | Fase 4 · Operation |
| slug | `incident-response` |
| execution | **CONDITIONAL** |
| lead_agent | `aidlc-operations-agent` |
| mode (topología) | **inline** |
| summary_confirmation | `required` (checkpoint consolidado obligatorio) |
| sensors | `required-sections`, `upstream-coverage` |
| requires_stage | `observability-setup` |


## Qué hace esta etapa

Etapa CONDITIONAL del Operations Agent: produce los runbooks de respuesta a incidentes, el plan de incidente (severidades, clasificación), la matriz de escalación y rotaciones on-call. Consume dashboards/alarms de 4.4 y los designs de reliability/security. Modela los failure modes más probables del sistema.

- Enterprise/workshop retienen toda la cola de operation; classic también.

## Posición en el flujo

```mermaid
flowchart LR
    PREV["4.4 · Observability Setup"] --> SELF["4.5 · Incident Response"]
    SELF --> NEXT["4.6 · Performance Validation"]
    SELF -. "self-skip si no aplica" .- SKIP["Saltada [S]"]
```
*Posición dentro de Fase 4 · Operation: 5 de 7.*

**Anterior:** [4.4 · Observability Setup](02-etapas/operation/observability-setup) · **Siguiente:** [4.6 · Performance Validation](02-etapas/operation/performance-validation)

## Paso a paso

**Step 1: Load Prior Context** — observability-setup + nfr-design (reliability, security) + infrastructure-specification.

**Step 2: Generate Clarifying Questions** — Failure modes más probables, rutas de escalación, on-call, ventanas de respuesta.

**Step 3: Generate Artifacts** — runbooks.md (por failure mode), incident-plan.md, escalation-matrix.md.

**Steps 4-5: Handoff + Gate** — Learnings + gate.


## Artefactos

```mermaid
flowchart LR
    c0["dashboards"]
    c1["alarms"]
    c2["reliability-design"]
    c3["security-design"]
    c4["infrastructure-specification"]
    ST(("4.5"))
    c0 --> ST
    c1 --> ST
    c2 --> ST
    c3 --> ST
    c4 --> ST
    p0["runbooks"]
    ST --> p0
    p1["incident-plan"]
    ST --> p1
    p2["escalation-matrix"]
    ST --> p2
    p3["incident-response-questions"]
    ST --> p3
```

| Dirección | Artefactos |
|---|---|
| **produce** | `runbooks`, `incident-plan`, `escalation-matrix`, `incident-response-questions` |
| **consume** | `dashboards`, `alarms`, `reliability-design`, `security-design`, `infrastructure-specification` |

## Agentes implicados

- **Lead:** [aidlc-operations-agent](03-agentes/aidlc-operations-agent) — posee los artefactos `produces[]` de la etapa.
- **Conductor:** el orquestador es el bus: los agentes NUNCA se invocan entre sí — solo el conductor delega. Ver [el oficio del conductor](06-maquinaria/conductor).

## Topología y ejecución

**Inline.** El lead corre en la propia sesión del conductor, cargando su persona; los supports (si los hay) son voces que el conductor adopta. Sin contribution files. 29 de las 33 etapas usan esta topología.

## Mecánica del gate

Sin reviewer declarado — el gate es directo:

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

**Ejecutan esta etapa:** `classic`, `enterprise`, `feature`, `workshop`

**La saltan:** `bugfix`, `express`, `infra`, `mvp`, `poc`, `refactor`, `security-patch`

Cada scope es una rejilla EXECUTE/SKIP sobre las 33 etapas. Ver [la matriz completa de scopes](05-scopes/README).

## Conexiones

- [Ficha de la Fase 4 · Operation](01-fases/fase-4-operacion)
- [Etapa anterior: 4.4](02-etapas/operation/observability-setup)
- [Etapa siguiente: 4.6](02-etapas/operation/performance-validation)
- [Ficha del lead: aidlc-operations-agent](03-agentes/aidlc-operations-agent)
- [Protocolos que gobiernan la etapa](04-protocolos/README)
