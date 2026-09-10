> [Inicio](README) › [Anexos](08-anexos/README) › **Matriz scopes × etapas**


# Matriz scopes × etapas (11 × 33)

Rejilla autoritativa compilada del repo. E = EXECUTE, · = SKIP. Las columnas siguen el orden del grafo.

| Scope | 0.1 | 0.2 | 0.3 | 1.1 | 1.2 | 1.3 | 1.4 | 1.5 | 1.6 | 1.7 | 2.1 | 2.2 | 2.3 | 2.4 | 2.5 | 2.6 | 2.7 | 2.8 | 2.9 | 3.1 | 3.2 | 3.3 | 3.4 | 3.5 | 3.6 | 3.7 | 4.1 | 4.2 | 4.3 | 4.4 | 4.5 | 4.6 | 4.7 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **bugfix** (9/33) | E | E | E | · | · | · | · | · | · | · | E | · | E | · | · | · | · | · | · | · | · | · | · | E | E | · | E | · | E | · | · | · | · |
| **classic** (26/33) | E | E | E | · | · | · | · | · | · | · | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E |
| **enterprise** (33/33) | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E |
| **express** (10/33) | E | E | E | · | · | · | · | · | · | · | E | · | E | · | · | · | · | · | · | · | · | · | · | E | E | · | E | · | E | E | · | · | · |
| **feature** (33/33) | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E |
| **infra** (13/33) | E | E | E | · | · | · | · | · | · | · | · | E | E | · | · | · | · | · | · | · | E | E | E | · | · | E | E | E | E | E | · | · | · |
| **mvp** (23/33) | E | E | E | E | · | E | E | · | E | · | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | · | · | · | · | · | · | · |
| **poc** (8/33) | E | E | E | E | · | · | · | · | · | · | E | · | E | · | · | · | · | · | · | · | · | · | · | E | E | · | · | · | · | · | · | · | · |
| **refactor** (10/33) | E | E | E | · | · | · | · | · | · | · | E | · | E | · | · | · | · | · | · | E | · | · | · | E | E | · | E | · | E | · | · | · | · |
| **security-patch** (10/33) | E | E | E | · | · | · | · | · | · | · | E | · | E | · | · | · | · | · | · | · | E | · | · | E | E | · | E | · | E | · | · | · | · |
| **workshop** (26/33) | E | E | E | · | · | · | · | · | · | · | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E | E |

## Análisis por columna (quién NO corre cada etapa)

| Etapa | Siempre ejecuta (11/11) | La saltan |
|---|---|---|
| **0.1** workspace-scaffold | sí | — |
| **0.2** workspace-detection | sí | — |
| **0.3** state-init | sí | — |
| **1.1** intent-capture | 4/11 | bugfix, classic, express, infra, refactor, security-patch, workshop |
| **1.2** market-research | 2/11 | bugfix, classic, express, infra, mvp, poc, refactor, security-patch, workshop |
| **1.3** feasibility | 3/11 | bugfix, classic, express, infra, poc, refactor, security-patch, workshop |
| **1.4** scope-definition | 3/11 | bugfix, classic, express, infra, poc, refactor, security-patch, workshop |
| **1.5** team-formation | 2/11 | bugfix, classic, express, infra, mvp, poc, refactor, security-patch, workshop |
| **1.6** rough-mockups | 3/11 | bugfix, classic, express, infra, poc, refactor, security-patch, workshop |
| **1.7** approval-handoff | 2/11 | bugfix, classic, express, infra, mvp, poc, refactor, security-patch, workshop |
| **2.1** reverse-engineering | 10/11 | infra |
| **2.2** practices-discovery | 6/11 | bugfix, express, poc, refactor, security-patch |
| **2.3** requirements-analysis | sí | — |
| **2.4** user-stories | 5/11 | bugfix, express, infra, poc, refactor, security-patch |
| **2.5** refined-mockups | 5/11 | bugfix, express, infra, poc, refactor, security-patch |
| **2.6** domain-design | 5/11 | bugfix, express, infra, poc, refactor, security-patch |
| **2.7** units-generation | 5/11 | bugfix, express, infra, poc, refactor, security-patch |
| **2.8** contract-design | 5/11 | bugfix, express, infra, poc, refactor, security-patch |
| **2.9** delivery-planning | 5/11 | bugfix, express, infra, poc, refactor, security-patch |
| **3.1** functional-design | 6/11 | bugfix, express, infra, poc, security-patch |
| **3.2** nfr-requirements | 7/11 | bugfix, express, poc, refactor |
| **3.3** nfr-design | 6/11 | bugfix, express, poc, refactor, security-patch |
| **3.4** infrastructure-design | 6/11 | bugfix, express, poc, refactor, security-patch |
| **3.5** code-generation | 10/11 | infra |
| **3.6** build-and-test | 10/11 | infra |
| **3.7** ci-pipeline | 6/11 | bugfix, express, poc, refactor, security-patch |
| **4.1** deployment-pipeline | 9/11 | mvp, poc |
| **4.2** environment-provisioning | 5/11 | bugfix, express, mvp, poc, refactor, security-patch |
| **4.3** deployment-execution | 9/11 | mvp, poc |
| **4.4** observability-setup | 6/11 | bugfix, mvp, poc, refactor, security-patch |
| **4.5** incident-response | 4/11 | bugfix, express, infra, mvp, poc, refactor, security-patch |
| **4.6** performance-validation | 4/11 | bugfix, express, infra, mvp, poc, refactor, security-patch |
| **4.7** feedback-optimization | 4/11 | bugfix, express, infra, mvp, poc, refactor, security-patch |

- Las **3 de inicialización** corren en los 11 scopes — el bootstrap es universal.
- **2.3 requirements** y **3.5/3.6 code/build** corren en 9-10: el núcleo duro del ciclo.
- **1.x ideation** es lo más recortado (solo enterprise/feature/mvp/poc la usan parcialmente).
- **4.x operation** solo la corren enterprise/feature/classic/workshop/infra (+deploy mínimo en express/incrementales).
