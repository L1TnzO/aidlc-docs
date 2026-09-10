> [Inicio](README) › [Anexos](08-anexos/README) › **Matriz de artefactos**


# Matriz de artefactos — el grafo produces/consumes

Qué produce y qué consume cada etapa (frontmatter autoritativo). Este grafo es la base de: el sensor `upstream-coverage`, la resolución de paths del engine, y la recuperación por evidencia de artefactos.

## Fase 0 · Inicialización

| Etapa | produce | consume |
|---|---|---|
| **0.1** workspace-scaffold | — | — |
| **0.2** workspace-detection | — | — |
| **0.3** state-init | — | — |

## Fase 1 · Ideation

| Etapa | produce | consume |
|---|---|---|
| **1.1** intent-capture | `intent-statement`, `stakeholder-map`, `intent-capture-questions` | — |
| **1.2** market-research | `competitive-analysis`, `market-trends`, `build-vs-buy`, `market-research-questions` | `intent-statement` |
| **1.3** feasibility | `feasibility-assessment`, `constraint-register`, `raid-log`, `feasibility-questions` | `intent-statement`, `competitive-analysis`, `market-trends`, `build-vs-buy` |
| **1.4** scope-definition | `scope-document`, `intent-backlog`, `scope-definition-questions` | `intent-statement`, `feasibility-assessment`, `constraint-register` |
| **1.5** team-formation | `team-assessment`, `skill-matrix`, `mob-composition`, `team-formation-questions` | `scope-document`, `intent-backlog`, `feasibility-assessment` |
| **1.6** rough-mockups | `wireframes`, `user-flow`, `rough-mockups-questions` | `intent-statement`, `scope-document`, `intent-backlog` |
| **1.7** approval-handoff | `initiative-brief`, `decision-log`, `approval-handoff-questions` | `intent-statement`, `stakeholder-map`, `scope-document`, `intent-backlog`, `competitive-analysis`, `feasibility-assessment`, `constraint-register`, `team-assessment`, `wireframes` |

## Fase 2 · Inception

| Etapa | produce | consume |
|---|---|---|
| **2.1** reverse-engineering | `business-overview`, `architecture`, `code-structure`, `api-documentation`, `component-inventory`, `technology-stack`, `dependencies`, `code-quality-assessment`, `reverse-engineering-timestamp` | — |
| **2.2** practices-discovery | `team-practices`, `discovered-rules`, `evidence`, `practices-discovery-timestamp` | `code-structure`, `technology-stack`, `dependencies`, `code-quality-assessment`, `architecture`, `business-overview` |
| **2.3** requirements-analysis | `requirements`, `requirements-analysis-questions` | `intent-statement`, `scope-document`, `business-overview`, `architecture`, `code-structure`, `team-practices` |
| **2.4** user-stories | `stories`, `personas`, `user-stories-assessment`, `traceability` | `requirements`, `business-overview`, `component-inventory`, `team-practices` |
| **2.5** refined-mockups | `mockups`, `interaction-spec`, `design-system-mapping`, `accessibility-checklist`, `refined-mockups-questions` | `wireframes`, `user-flow`, `stories`, `requirements`, `team-practices` |
| **2.6** domain-design | `components`, `decisions`, `traceability` | `requirements`, `stories`, `architecture`, `component-inventory`, `team-practices` |
| **2.7** units-generation | `unit-of-work`, `unit-of-work-dependency`, `unit-of-work-story-map`, `traceability` | `components`, `decisions`, `requirements`, `stories` |
| **2.8** contract-design | `contract-summary` | `unit-of-work`, `unit-of-work-dependency`, `components`, `requirements` |
| **2.9** delivery-planning | `bolt-plan`, `team-allocation`, `risk-and-sequencing-rationale`, `external-dependency-map`, `delivery-planning-questions` | `requirements`, `stories`, `mockups`, `components`, `unit-of-work`, `unit-of-work-dependency`, `unit-of-work-story-map`, `contract-summary`, `team-practices` |

## Fase 3 · Construction

| Etapa | produce | consume |
|---|---|---|
| **3.1** functional-design | `entities`, `rules`, `functional-spec`, `traceability` | `unit-of-work`, `unit-of-work-story-map`, `requirements`, `components`, `contract-summary` |
| **3.2** nfr-requirements | `performance-requirements`, `security-requirements`, `scalability-requirements`, `reliability-requirements`, `observability-requirements`, `tech-stack-decisions`, `traceability` | `functional-spec`, `rules`, `requirements`, `contract-summary`, `technology-stack` |
| **3.3** nfr-design | `performance-design`, `security-design`, `scalability-design`, `reliability-design`, `observability-design`, `logical-components`, `traceability` | `performance-requirements`, `security-requirements`, `scalability-requirements`, `reliability-requirements`, `observability-requirements`, `tech-stack-decisions`, `functional-spec`, `contract-summary` |
| **3.4** infrastructure-design | `infrastructure-specification`, `monitoring-design`, `cicd-pipeline`, `traceability` | `performance-design`, `security-design`, `scalability-design`, `reliability-design`, `observability-design`, `logical-components`, `components`, `functional-spec`, `contract-summary` |
| **3.5** code-generation | `code-generation-plan`, `unit-test-instructions`, `code-summary`, `traceability` | `functional-spec`, `rules`, `entities`, `contract-summary`, `performance-design`, `security-design`, `infrastructure-specification`, `unit-of-work`, `requirements` |
| **3.6** build-and-test | `build-instructions`, `integration-test-instructions`, `performance-test-instructions`, `security-test-instructions`, `build-and-test-summary`, `build-test-results`, `cross-unit-traceability` | `code-generation-plan`, `unit-test-instructions`, `code-summary` |
| **3.7** ci-pipeline | `ci-config`, `quality-gates`, `ci-pipeline-questions` | `code-summary`, `build-and-test-summary`, `build-test-results` |

## Fase 4 · Operation

| Etapa | produce | consume |
|---|---|---|
| **4.1** deployment-pipeline | `cd-config`, `deployment-strategy`, `rollback-runbook`, `deployment-pipeline-questions` | `ci-config`, `quality-gates`, `infrastructure-specification`, `cicd-pipeline` |
| **4.2** environment-provisioning | `environment-inventory`, `validation-report`, `environment-provisioning-questions` | `infrastructure-specification`, `cd-config` |
| **4.3** deployment-execution | `deployment-log`, `smoke-test-results`, `health-check-report`, `deployment-execution-questions` | `cd-config`, `deployment-strategy`, `environment-inventory`, `build-test-results` |
| **4.4** observability-setup | `dashboards`, `alarms`, `slo-config`, `log-queries`, `tracing-config`, `anomaly-config`, `observability-setup-questions` | `performance-design`, `security-design`, `reliability-design`, `monitoring-design`, `infrastructure-specification` |
| **4.5** incident-response | `runbooks`, `incident-plan`, `escalation-matrix`, `incident-response-questions` | `dashboards`, `alarms`, `reliability-design`, `security-design`, `infrastructure-specification` |
| **4.6** performance-validation | `load-test-plan`, `load-test-results`, `nfr-validation-matrix`, `performance-validation-questions` | `performance-requirements`, `scalability-requirements`, `performance-design`, `scalability-design`, `dashboards` |
| **4.7** feedback-optimization | `slo-report`, `cost-analysis`, `drift-report`, `feedback-loop`, `feedback-optimization-questions` | `dashboards`, `alarms`, `slo-config`, `deployment-log`, `load-test-results`, `incident-plan` |

## Artefactos por etapa → quién los consume después

| Artefacto | Producido por | Consumido por |
|---|---|---|
| `accessibility-checklist` | 2.5 | — |
| `alarms` | 4.4 | 4.5, 4.7 |
| `anomaly-config` | 4.4 | — |
| `api-documentation` | 2.1 | — |
| `approval-handoff-questions` | 1.7 | — |
| `architecture` | 2.1 | 2.2, 2.3, 2.6 |
| `bolt-plan` | 2.9 | — |
| `build-and-test-summary` | 3.6 | 3.7 |
| `build-instructions` | 3.6 | — |
| `build-test-results` | 3.6 | 3.7, 4.3 |
| `build-vs-buy` | 1.2 | 1.3 |
| `business-overview` | 2.1 | 2.2, 2.3, 2.4 |
| `cd-config` | 4.1 | 4.2, 4.3 |
| `ci-config` | 3.7 | 4.1 |
| `ci-pipeline-questions` | 3.7 | — |
| `cicd-pipeline` | 3.4 | 4.1 |
| `code-generation-plan` | 3.5 | 3.6 |
| `code-quality-assessment` | 2.1 | 2.2 |
| `code-structure` | 2.1 | 2.2, 2.3 |
| `code-summary` | 3.5 | 3.6, 3.7 |
| `competitive-analysis` | 1.2 | 1.3, 1.7 |
| `component-inventory` | 2.1 | 2.4, 2.6 |
| `components` | 2.6 | 2.7, 2.8, 2.9, 3.1, 3.4 |
| `constraint-register` | 1.3 | 1.4, 1.7 |
| `contract-summary` | 2.8 | 2.9, 3.1, 3.2, 3.3, 3.4, 3.5 |
| `cost-analysis` | 4.7 | — |
| `cross-unit-traceability` | 3.6 | — |
| `dashboards` | 4.4 | 4.5, 4.6, 4.7 |
| `decision-log` | 1.7 | — |
| `decisions` | 2.6 | 2.7 |
| `delivery-planning-questions` | 2.9 | — |
| `dependencies` | 2.1 | 2.2 |
| `deployment-execution-questions` | 4.3 | — |
| `deployment-log` | 4.3 | 4.7 |
| `deployment-pipeline-questions` | 4.1 | — |
| `deployment-strategy` | 4.1 | 4.3 |
| `design-system-mapping` | 2.5 | — |
| `discovered-rules` | 2.2 | — |
| `drift-report` | 4.7 | — |
| `entities` | 3.1 | 3.5 |
| `environment-inventory` | 4.2 | 4.3 |
| `environment-provisioning-questions` | 4.2 | — |
| `escalation-matrix` | 4.5 | — |
| `evidence` | 2.2 | — |
| `external-dependency-map` | 2.9 | — |
| `feasibility-assessment` | 1.3 | 1.4, 1.5, 1.7 |
| `feasibility-questions` | 1.3 | — |
| `feedback-loop` | 4.7 | — |
| `feedback-optimization-questions` | 4.7 | — |
| `functional-spec` | 3.1 | 3.2, 3.3, 3.4, 3.5 |
| `health-check-report` | 4.3 | — |
| `incident-plan` | 4.5 | 4.7 |
| `incident-response-questions` | 4.5 | — |
| `infrastructure-specification` | 3.4 | 3.5, 4.1, 4.2, 4.4, 4.5 |
| `initiative-brief` | 1.7 | — |
| `integration-test-instructions` | 3.6 | — |
| `intent-backlog` | 1.4 | 1.5, 1.6, 1.7 |
| `intent-capture-questions` | 1.1 | — |
| `intent-statement` | 1.1 | 1.2, 1.3, 1.4, 1.6, 1.7, 2.3 |
| `interaction-spec` | 2.5 | — |
| `load-test-plan` | 4.6 | — |
| `load-test-results` | 4.6 | 4.7 |
| `log-queries` | 4.4 | — |
| `logical-components` | 3.3 | 3.4 |
| `market-research-questions` | 1.2 | — |
| `market-trends` | 1.2 | 1.3 |
| `mob-composition` | 1.5 | — |
| `mockups` | 2.5 | 2.9 |
| `monitoring-design` | 3.4 | 4.4 |
| `nfr-validation-matrix` | 4.6 | — |
| `observability-design` | 3.3 | 3.4 |
| `observability-requirements` | 3.2 | 3.3 |
| `observability-setup-questions` | 4.4 | — |
| `performance-design` | 3.3 | 3.4, 3.5, 4.4, 4.6 |
| `performance-requirements` | 3.2 | 3.3, 4.6 |
| `performance-test-instructions` | 3.6 | — |
| `performance-validation-questions` | 4.6 | — |
| `personas` | 2.4 | — |
| `practices-discovery-timestamp` | 2.2 | — |
| `quality-gates` | 3.7 | 4.1 |
| `raid-log` | 1.3 | — |
| `refined-mockups-questions` | 2.5 | — |
| `reliability-design` | 3.3 | 3.4, 4.4, 4.5 |
| `reliability-requirements` | 3.2 | 3.3 |
| `requirements` | 2.3 | 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3.1, 3.2, 3.5 |
| `requirements-analysis-questions` | 2.3 | — |
| `reverse-engineering-timestamp` | 2.1 | — |
| `risk-and-sequencing-rationale` | 2.9 | — |
| `rollback-runbook` | 4.1 | — |
| `rough-mockups-questions` | 1.6 | — |
| `rules` | 3.1 | 3.2, 3.5 |
| `runbooks` | 4.5 | — |
| `scalability-design` | 3.3 | 3.4, 4.6 |
| `scalability-requirements` | 3.2 | 3.3, 4.6 |
| `scope-definition-questions` | 1.4 | — |
| `scope-document` | 1.4 | 1.5, 1.6, 1.7, 2.3 |
| `security-design` | 3.3 | 3.4, 3.5, 4.4, 4.5 |
| `security-requirements` | 3.2 | 3.3 |
| `security-test-instructions` | 3.6 | — |
| `skill-matrix` | 1.5 | — |
| `slo-config` | 4.4 | 4.7 |
| `slo-report` | 4.7 | — |
| `smoke-test-results` | 4.3 | — |
| `stakeholder-map` | 1.1 | 1.7 |
| `stories` | 2.4 | 2.5, 2.6, 2.7, 2.9 |
| `team-allocation` | 2.9 | — |
| `team-assessment` | 1.5 | 1.7 |
| `team-formation-questions` | 1.5 | — |
| `team-practices` | 2.2 | 2.3, 2.4, 2.5, 2.6, 2.9 |
| `tech-stack-decisions` | 3.2 | 3.3 |
| `technology-stack` | 2.1 | 2.2, 3.2 |
| `traceability` | 2.4, 2.6, 2.7, 3.1, 3.2, 3.3, 3.4, 3.5 | — |
| `tracing-config` | 4.4 | — |
| `unit-of-work` | 2.7 | 2.8, 2.9, 3.1, 3.5 |
| `unit-of-work-dependency` | 2.7 | 2.8, 2.9 |
| `unit-of-work-story-map` | 2.7 | 2.9, 3.1 |
| `unit-test-instructions` | 3.5 | 3.6 |
| `user-flow` | 1.6 | 2.5 |
| `user-stories-assessment` | 2.4 | — |
| `validation-report` | 4.2 | — |
| `wireframes` | 1.6 | 1.7, 2.5 |

El **hub del grafo**: `requirements` (lo consumen 7 etapas), `unit-of-work` + `unit-of-work-dependency` (el DAG que gobierna construction), `components` y `contract-summary` (los contratos compartidos que los reviewers per-unit verifican).
