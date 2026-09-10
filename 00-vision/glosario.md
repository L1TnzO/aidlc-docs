> [Inicio](README) › [Visión](00-vision/README) › **Glosario**

# Glosario AI-DLC

Terminología oficial del protocolo (§9 de `stage-protocol.md`, traducida) más el vocabulario operativo que aparece en toda la documentación. Los términos se mantienen en inglés cuando así los usa el framework, por ser el idioma de los artefactos reales.

## Estructura del ciclo

| Término | Definición |
|---|---|
| **Phase (fase)** | Agrupación de nivel superior: INITIALIZATION, IDEATION, INCEPTION, CONSTRUCTION, OPERATION |
| **Stage (etapa)** | Paso discreto dentro de una fase (p.ej. Intent Capture, Requirements Analysis, Code Generation) |
| **Scope** | Controla qué stages ejecutan y a qué depth. Once built-in (uno por archivo bajo `scopes/`); se pueden agregar custom |
| **Depth** | Escala de detalle: Minimal, Standard o Comprehensive — la determina el scope y la puede sobreescribir el usuario |
| **Test Strategy** | Volumen de tests: Minimal / Standard / Comprehensive — independiente del depth desde v2 |
| **Artifact** | Archivo markdown versionado bajo el record del intent activo: registra una decisión, diseño o análisis |
| **Planning** | Stages que analizan, preguntan y diseñan (producen artefactos markdown) |
| **Generation** | Stages que producen código ejecutable (Code Generation, Build and Test) |

## Construction en detalle

| Término | Definición |
|---|---|
| **Bolt** | Iteración tipo sprint de Construction sobre una o más Units dependency-linked. Delivery Planning (2.9) registra el agrupamiento, DoD, hipótesis de confianza y ownership. El walk runtime por defecto (stage-major) no consume bolt-plan.md como boundary |
| **Unit of Work** | El QUÉ: pieza independientemente implementable del sistema, descompuesta en Units Generation (2.7) |
| **Walking skeleton** | El primer Bolt planeado — el slice end-to-end más delgado que ejercita cada punto de integración. Siempre gated e interactivo |
| **Ladder prompt** | El prompt único que sigue al gate del walking skeleton: "¿continuar autónomo o gate por Bolt?" — queda como `Construction Autonomy Mode` |
| **Autonomy mode** | `gated` (gates por stage) o `autonomous` (salta los gates restantes de Construction y habilita swarm). Nunca inferido: solo explícito |
| **Parallel batch** | Grupo runtime de Units del dependency DAG sin dependencias mutuas — pueden correr concurrentes |
| **Walk order** | Default: stage-major (un stage corre para todas las Units, luego el siguiente). Opt-in: unit-major (una Unit cruza todos sus stages, luego la siguiente) |
| **Worktree** | Mecanismo de aislamiento git para una Unit bajo swarm autónomo (`bolt-<slug>` branch) |

## Sistema de verificación

| Término | Definición |
|---|---|
| **Gate (approval gate)** | Checkpoint humano obligatorio: Approve / Request Changes. HARD STOP — no se auto-aprueba ni se infiere |
| **Reviewer** | Agente review-only (Product Lead o Architecture Reviewer) que verifica un artefacto desde fuera. Adversarial (refute-and-repair) o advisory (una pasada) |
| **Review class** | Cómo corre el review: `adversarial` (default Construction) o `advisory` (default ideation/inception) — el scope la puede topar con `review_cap` |
| **Sensor** | Check determinista importado por la etapa (`sensors:` frontmatter): advisory (emite findings) o blocking (exige pass verificado para abrir el gate) |
| **Traceability** | Trazabilidad elemento a elemento: FR → US → AC → U → BR con IDs estables, validada por el sensor `traceability` en cada write |
| **PHASE_VERIFIED** | Evento de auditoría que registra la verificación de frontera de fase (governance protocol) |

## Motor y ejecución

| Término | Definición |
|---|---|
| **Conductor** | La persona del orquestador que ejecuta la etapa: recibe directivas del engine, hace UNA movida, reporta, repite |
| **Engine** | Las tools TS deterministas: máquina de estados, auditoría, referee de agentes paralelos. Byte-identical entre harnesses |
| **Directive** | La instrucción que el engine emite al conductor (`next`, `run-stage`, `invoke-swarm`, `ask`) |
| **Harness** | El runtime anfitrión (Claude Code, Kiro, Codex…) — lo que el usuario instala y donde corre el engine |
| **Record** | El directorio de trabajo del intent activo: `<record>/<fase>/<etapa>/`, audit/, verification/, aidlc-state.md |
| **Space** | Unidad de método del equipo: memoria + knowledge + codekb bajo `aidlc/spaces/<space>/` |
| **Intent** | Una corrida del workflow bajo un space — con su record, estado y artifacts |
| **CodeKB** | Base de conocimiento de código por repo (fruto de Reverse Engineering) reutilizable entre intents |
| **Guardrail** | Regla de comportamiento aprendida, guardada en la memoria del space (org / team / project) |
| **Learnings ritual** | El paso §13 de cada gate: detecta candidatos de aprendizaje del diary, el usuario decide, la tool persiste |
| **Memory.md (diary)** | El diario de observaciones por etapa: Interpretations / Deviations / Tradeoffs / Open questions |
| **Forwarding loop** | El ciclo del conductor: directiva → una movida → reporte → siguiente directiva |

## Estados de una etapa (checkboxes)

| Marca | Estado |
|---|---|
| `[ ]` | Pendiente |
| `[-]` | En progreso (actual, sin aprobar) |
| `[?]` | Awaiting approval (gate abierto) |
| `[R]` | Revising (gate rechazado, en revisión) |
| `[x]` | Completada (aprobada) |
| `[S]` | Saltada (excluida de conteos de progreso) |

## Vocabulario reservado del conductor

El voice contract del protocolo prohíbe usar vocabulario interno en la narración al usuario: `engine`, `directive`, `dispatch`, `conductor`, `harness`, `verb`, `scope grid`, `steering`, `forwarding loop`, `mint`, `swarm`, `entropy`, ARS (IAE, CSU, VE, R, UA). El usuario oye "el workflow", "el siguiente paso", "traigo al arquitecto". El usuario construye su proyecto, sin instrucción sobre este framework.

| En vez de | Se dice |
|---|---|
| the engine / orchestration engine | the workflow, o simplemente "I" |
| the next directive | the next step |
| dispatch the architect agent | hand this off to the architect |
| your harness / harness dir | your project setup |
| verify/validate the artifact | check it |
| the compiled scope grid says | this workflow covers |
