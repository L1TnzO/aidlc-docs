> [Inicio](README) › [Knowledge](07-knowledge/README) › **Verificación**

# Verificación automática: trazabilidad elemento a elemento

El sistema de verificación de AI-DLC trabaja a nivel de ELEMENTO, no de documento: cada requisito, story, regla y unidad tiene un ID estable, y los artefactos declaran su cobertura en `traceability.json` — validado por el sensor en cada write y visible en gates, reviews y completion.

## Los IDs estables

| Prefijo | Qué nombra | Ejemplo |
|---|---|---|
| `FR{n}` / `FR{n}.{m}` | Requisito funcional (y sub-requisito) | `FR1`, `FR1.2` |
| `NFR{n}` | NFR de inception | `NFR2` |
| `NFRx.y` | NFR detallado de construction | `NFR2.1` |
| `US{n}.{m}` | User story | `US1.3` |
| `AC{n}.{m}.{seq}` | Criterio de aceptación | `AC1.3.2` |
| `U{n}` / `u{n}-{desc}` | Unit ID / directorio de construcción | `U1`, `u1-auth` |
| `BR{group}.{seq}` | Regla de negocio | `BR1.1` |

## La forma del traceability.json

```json
{
  "stage": "functional-design",
  "unit": "u1-auth",
  "upstream_ids": ["AC1.1.1"],
  "coverage": [
    { "id": "AC1.1.1", "status": "OK", "target": "BR1.1" }
  ],
  "reverse": [
    { "id": "BR1.3", "status": "N/A", "target": "technical validation rule" }
  ]
}
```

**Statuses válidos**: `OK`, `GAP`, `ORPHAN`, `Deferred`, `N/A` — los tres primeros requieren target o justificación no vacía. El sensor cruza los upstream IDs de los artefactos fuente, verifica targets deterministas donde puede, y deriva huérfanos (una regla de negocio sin upstream es un diseño colado).

## Cuándo corre

| Trigger | Qué chequea |
|---|---|
| **Write de un stage output** | Coverage elemento a elemento del artefacto escrito |
| **Ideation → Inception** | Intent → Scope → Intent Backlog; todo scope item con respaldo de viabilidad |
| **Inception → Construction** | Requirements → Stories → Architecture; toda story traza; la arquitectura cubre todas |
| **Construction → Operation** | Architecture → Code → Tests; todo código traza a diseño; cobertura vs ACs |
| **On demand** | El humano puede pedir verificación en cualquier punto |

## El output del boundary check

`<record>/verification/phase-check-<fase>.md`: porcentajes de cobertura (requirements con stories, stories con components…), warnings de mappings incompletos, checks de consistencia (sin contradicciones entre fases) y un checkbox de aprobación humana. El engine graba `PHASE_VERIFIED` en el shard del record — jamás append manual.

## Por qué elemento a nivel (y no documento a documento)

Un documento puede "referirse" a los requisitos sin cubrirlos: el elemento-ID hace falsable la cobertura. La cadena `FR1.2 → US1.3 → AC1.3.2 → BR1.1 → U1 → test` es verificable por máquina en cada eslabón — y el coverage gate de Build & Test (3.6) la exige completa para cada FR, NFR y AC de tres segmentos antes de cerrar.
