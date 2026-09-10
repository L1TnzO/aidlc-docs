> [Inicio](README) › [Protocolos](04-protocolos/README) › **stage-definition**

# Formato de definición de etapa

Contrato de autoría para los 33 archivos de etapa: qué campos se escriben a mano, cuáles son computados, y qué compartimentos puede tener el body. La invariant de compile: **lo compilado debe ser derivable de lo autorado**. Cualquier drift es error de build.

## File layout

```markdown
---
slug, phase, execution, condition, lead_agent,
support_agents, mode, reviewer, review_artifact,
reviewer_max_iterations, review_class, produces,
consumes, requires_stage, sensors, scopes, inputs, outputs
---            # ← campos AUTORADOS

# [Stage Title]

## Steps      # prosa obligatoria, siempre poblada
## Sensors    # resumen Imports/Upstream compacto
## Learn      # puntero a §13 (los bootstrap mantienen la excepción)
```

## Campos autorados vs computados

| Autorado (frontmatter) | Computado por el engine (NUNCA a mano) |
|---|---|
| slug, phase, execution (ALWAYS/CONDITIONAL) | number (0.1–4.7, del grafo) |
| condition (cuándo corre/salta) | next por scope, gate boundaries |
| lead_agent, support_agents | runtime-graph, progress totals |
| mode (inline/subagent/pipeline/mob) | unit batching, waves, floors |
| reviewer, review_artifact, max_iterations | review_class efectiva (− review_cap − override) |
| produces, consumes, requires_stage | artefact resolution (paths del record) |
| sensors (import list) | imports aplicables por fire_on |
| scopes (columnas de la rejilla) | scope grid compilada |
| inputs, outputs (documentación) | stage table / doctor checks |

## Los compartimentos del body

- **Steps**: prosa obligatoria: los pasos numerados de la etapa. Inmutables en runtime (framework-only), con UNA excepción sancionada: el append al import list `sensors:` (la instalación dos-escrituras de un sensor aprendido).
- **Sensors**: resumen local de Imports/Upstream targets. El frontmatter es autoritativo cuando hay diferencia.
- **Learn**: puntero compacto al §13 del stage-protocol.

## Rutas de artefactos: engine-resolved

Ningún stage `.md` hardcodea un root: `{{HARNESS_DIR}}` se sustituye al empaquetar, y los outputs se resuelven bajo el record del intent activo en runtime (`<record>/<phase>/<stage>/`). Por eso una misma definición corre en 7 harnesses y N proyectos.

## Plugin + future extensions

Los campos `kind`, `plugin`, `contribution` y el namespace reservado (`x-*`) permiten a plugins añadir etapas y contribuciones aditivas sin tocar el core. El validador de stage-schema + el drift guard de CI garantizan que lo que se compila es exactamente lo que se autoró.

## Por qué importa este formato

Porque hace al grafo **verificable de punta a punta**: la rejilla de scopes se compila de los frontmatter `scopes:`, el routing de `requires_stage:`, la evidencia de completion de `produces:`, los checks de `sensors:`. Si el formato fuera libre, cada consumidor inventaría su parseo y el contrato se rompería en silencio. Ver [matriz de artefactos](08-anexos/matriz-artefactos) para el grafo produces/consumes compilado.
