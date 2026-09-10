> [Inicio](README) › [Anexos](08-anexos/README) › **AI-DLC vs Agile**

# AI-DLC frente a las metodologías clásicas

AI-DLC no compite con Agile: lo **re-instrumenta** para un equipo donde los ejecutores son agentes y el humano es product-owner + gate. La comparación ayuda a ubicar qué cambia realmente.

## Comparación estructural

| Dimensión | Scrum clásico | Waterfall | Spec-driven (SpecDD) | **AI-DLC** |
|---|---|---|---|---|
| **Ejecutor** | Equipo humano | Equipo humano | Humano + herramientas | **Agentes LLM con protocolo estricto** |
| **Unidad de trabajo** | Sprint | Fase | Spec → implementación | **Etapa con gate** (y Unit/Bolt en construction) |
| **Aprobación** | Review de sprint | Sign-off de fase | Aceptación de spec | **Gate estructurado por etapa: Approve/Request Changes con receipt** |
| **Artefactos** | Board + docs informales | Documentación pesada | Specs formales | **Markdown versionado por etapa, en el record del intent** |
| **Trazabilidad** | Manual/implícita | Documental | Spec → código | **Elemento a elemento: FR→US→AC→U→BR→test, sensor-verificada** |
| **Cambio de requirements** | Backlog grooming | Change request formal | Re-spec | **Change handling §7 + recompose + jump con invalidación de receipts** |
| **Calidad** | Definición de hecho del equipo | QA phase | Suites contra specs | **Reviewer adversarial + sensores deterministas + coverage gate** |
| **Aprendizaje** | Retrospectiva → con sensatez, action items | Lecciones aprendidas (tardías) | — | **Learnings ritual por etapa → reglas que la próxima corrida CARGA** |
| **Planificación** | Estimación humana | Gantt | Plan de specs | **Scope grid + depth + composer por entropía** |
| **Paralelismo** | Cross-functional team | Fases secuenciales | — | **Topologías: subagent/pipeline/mob + swarm con worktrees** |

## Qué toma prestado (y de quién)

- **Del mob programming**: el small-mob de agentes amplios que cargan contexto — sin handoffs waterfall.
- **De BDD/TDD**: acceptance criteria Given/When/Then; testing posture afirmada en team.md (Methodology/Ordering explícitos).
- **De DDD**: bounded contexts, aggregates, entity ownership única — el component catalogue lo exige.
- **De SRE**: golden signals, SLO/SLI, error budgets, runbooks, blameless postmortems → el design de la fase operation.
- **De trunk-based + CI/CD**: squash-merge de Bolts, deploy-on-merge con gate manual a producción.
- **De las methodologies formales (spec-driven)**: contratos versionados (OpenAPI/AsyncAPI), ADRs con alternativas, IDs estables.

## Lo genuinamente nuevo

1. **El humano como gate, no como worker**: la productividad viene de aprobar/retro-alimentar, no de teclear. Cada gate tiene receipt auditable (HUMAN_TURN).
2. **Verificación adversarial nativa**: el reviewer por diseño intenta romper el artefacto — el "confirma-su-propio-trabajo" del LLM queda estructuralmente fuera.
3. **Autonomía graduada y auditable**: walking skeleton gated → ladder → autonomous con halt-and-ask en fallos, receipts por unidad y merge squash.
4. **Self-learning cerrado**: la corrección humana de HOY es la regla que el runtime carga MAÑANA (memoria de método de 3 capas).
5. **El workflow se adapta por entropía**: el composer estima el riesgo del intent y compone el mínimo viable — ni keyword-rigid ni todo-agile.

## Dónde NO encaja bien (honestidad operativa)

- Equipos 100% humanos sin agentes: la maquinaria de gates/receipts sobra — usen Scrum.
- Exploración artística de una persona: express o ninguna metodología.
- Regulación que exige firmas humanas en cada artefacto: enterprise lo soporta, pero el sign-off final sigue siendo humano.
- Workflows de datos/ML no-software: las fases operation asumen despliegue de software.
