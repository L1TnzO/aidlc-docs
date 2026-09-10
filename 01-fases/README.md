> [Inicio](README) › **Fases**

# 01 · Las 5 fases del ciclo de vida

AI-DLC organiza las 33 etapas en **cinco fases** con propósito y outcome propios. Cada fase termina en una **verificación de frontera** (governance) que valida la trazabilidad antes de pasar a la siguiente, salvo Initialization→Ideation, sin chequeo por tratarse de bootstrap.

```mermaid
flowchart TD
    subgraph F0["FASE 0 · INITIALIZATION (3 etapas)"]
        direction LR
        A["0.1 Scaffold"] --> B["0.2 Detection"] --> C["0.3 State Init"]
    end
    subgraph F1["FASE 1 · IDEATION (7 etapas)"]
        direction LR
        D1["1.1 Intent"] --> D2["1.2 Market"] --> D3["1.3 Feasibility"] --> D4["1.4 Scope"] --> D5["1.5 Team"] --> D6["1.6 Rough Mockups"] --> D7["1.7 Approval Handoff"]
    end
    subgraph F2["FASE 2 · INCEPTION (9 etapas)"]
        direction LR
        E1["2.1 RE"] --> E2["2.2 Practices"] --> E3["2.3 Requirements"] --> E4["2.4 Stories"] --> E5["2.5 Refined Mockups"] --> E6["2.6 Domain"] --> E7["2.7 Units"] --> E8["2.8 Contracts"] --> E9["2.9 Delivery Plan"]
    end
    subgraph F3["FASE 3 · CONSTRUCTION (7 etapas)"]
        direction LR
        G1["3.1 Functional"] --> G2["3.2 NFR Req"] --> G3["3.3 NFR Design"] --> G4["3.4 Infra"] --> G5["3.5 Code Gen"] --> G6["3.6 Build & Test"] --> G7["3.7 CI"]
    end
    subgraph F4["FASE 4 · OPERATION (7 etapas)"]
        direction LR
        H1["4.1 Deploy Pipeline"] --> H2["4.2 Environments"] --> H3["4.3 Deploy Exec"] --> H4["4.4 Observability"] --> H5["4.5 Incidents"] --> H6["4.6 Performance"] --> H7["4.7 Feedback"]
    end
    F0 -->|"sin chequeo (bootstrap)"| F1
    F1 -->|"boundary check:<br/>intent→scope→backlog"| F2
    F2 -->|"boundary check:<br/>reqs→stories→architecture"| F3
    F3 -->|"boundary check:<br/>arch→code→tests"| F4
```

## Tabla maestra

| Fase | Propósito | Outcome clave | Etapas | Siempre in-scope |
|---|---|---|---|---|
| [0 · Inicialización](01-fases/fase-0-inicializacion) | Bootstrap: scaffold, detección, estado | Workspace configurado y listo | 3 | 0.1 0.2 0.3 (en todos los scopes) |
| [1 · Ideation](01-fases/fase-1-ideacion) | Validar la iniciativa | Initiative brief aprobado | 7 | 1.1, 1.4, 1.7 |
| [2 · Inception](01-fases/fase-2-inception) | Elaborar el plan | Plan de ejecución detallado | 9 | 2.3, 2.7, 2.9 |
| [3 · Construction](01-fases/fase-3-construccion) | Construir | Código funcionando y testeado | 7 | 3.5, 3.6 |
| [4 · Operation](01-fases/fase-4-operacion) | Desplegar y operar | Sistema en producción con monitoreo | 7 | (condicionales según scope) |

## Las tres fronteras de gobernanza

| Frontera | Transición | Qué se verifica |
|---|---|---|
| Ideation → Inception | approval-handoff → reverse-engineering | Intent capturado, scope definido, viabilidad confirmada, iniciativa aprobada |
| Inception → Construction | delivery-planning → functional-design | Toda story traza a requisito, la arquitectura cubre todas las stories, units definidas, plan aprobado |
| Construction → Operation | ci-pipeline → deployment-pipeline | Todas las units built+tested, CI configurado, infra diseñada |

Cada frontera produce `<record>/verification/[fase]-verification.md` y emite `PHASE_VERIFIED`. Ver el [protocolo de governance](04-protocolos/protocolo-governance).

## Guardrails por fase

Cada fase tiene su archivo de reglas en la memoria de método (`memory/phases/<fase>.md`), que las etapas importan automáticamente. Por ejemplo, inception exige: requisitos testeables (sin admitir "fast" sin umbral), ADRs con ≥2 alternativas, stories Given/When/Then, y prohibición de introducir requisitos sin documentar su origen.

## El pipeline según tu scope

Las 33 etapas constituyen el grafo completo; el scope recorta la rejilla. `enterprise` y `feature` ejecutan la totalidad; `classic`/`workshop` saltan ideation; `mvp` además salta operation; los incrementales (bugfix, refactor, security-patch, poc, express) recortan al mínimo. Ver la [matriz de scopes](05-scopes/README).
