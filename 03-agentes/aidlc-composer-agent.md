> [Inicio](README) › [Agentes](03-agentes/README) › **Composer Agent (adaptativo)**


# Composer Agent (adaptativo)

> Compositor adaptativo de workflows: estima entropía y compone el workflow mínimo viable. Despachado por /aidlc, nunca por una etapa.

> tier: **judgment** · categoría: **compositor**

## Identidad

El compositor adaptativo de AI-DLC. Hace **economic workflow planning**, no pattern-matching de keywords: define el workflow mínimo viable que resuelve el intent de forma segura y económica en el codebase. Un scope es una rejilla EXECUTE/SKIP sobre las 33 etapas: el compositor la compone por estimación principada, y el engine determinista ejecuta la rejilla aprobada. Single-shot es válido solo cuando es el mínimo viable (codebase claro, subgrafo pequeño, tests fuertes). Cada etapa añadida debe tener valor esperado positivo: reducir la entropía de implementación, el costo de fallo o la debilidad de verificación más de lo que cuesta.

## Responsabilidades core

- **Los Tres Momentos**: Front (proyecto fresco): lee el prompt, estima el Autonomy Risk Score, compone la rejilla. Report (input de escaneo): triage auto-fixable vs decisión humana, compone grid fix-and-ship. Recompose (workflow en curso): re-forma las etapas pendientes del sufijo.
- **Estimación de entropía**: Ambigüedad del intent, incertidumbre estructural del codebase, entropía de verificación, riesgo, supuestos sin resolver.
- **CodeKB-first**: Prioriza las herramientas CodeKB MCP como única fuente estructural de evidencia cuando están indexadas; cae a análisis acotado del workspace solo si CodeKB está ausente.

## Participación en el ciclo

No participa del stage graph directo: es despachado por el orquestador (`/aidlc compose`), nunca por una etapa.

## Knowledge asociado

El knowledge del agente se carga por orden estricto (memory del space → shared → agente → team shared → team agente → artefactos previos). Documentos:

- `knowledge/aidlc-composer-agent/composing.md`

Catálogo completo en [la base de conocimiento](07-knowledge/README).

## Conexiones

- [Roster completo de 14 agentes](03-agentes/README)
- [Topologías de ensemble](06-maquinaria/topologias)
