> [Inicio](README) › [Anexos](08-anexos/README) › **Matriz etapas × agentes**


# Matriz etapas × agentes (33 × 13)

Participación real por etapa, compilada del stage graph: **L** = lead (posee los artefactos), **S** = support (colabora), **R** = reviewer (verifica). El Composer no participa del grafo (lo despacha `/aidlc compose`).

| Etapa | Product | Design | Delivery | Architect | AWS Plat. | Compliance | DevSecOps | Developer | Quality | Pipe&Dep | Operations | R:ProdLead | R:ArchRev |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **0.1** workspace-scaffold |  |  |  |  |  |  |  |  |  |  |  |  |  |
| **0.2** workspace-detection |  |  |  |  |  |  |  |  |  |  |  |  |  |
| **0.3** state-init |  |  |  |  |  |  |  |  |  |  |  |  |  |
| **1.1** intent-capture | **L** |  |  | S |  |  |  |  |  |  |  | R |  |
| **1.2** market-research | **L** |  |  |  |  |  |  |  |  |  |  |  |  |
| **1.3** feasibility |  |  |  | **L** | S | S |  |  |  |  |  |  |  |
| **1.4** scope-definition | **L** |  | S |  |  |  |  |  |  |  |  |  |  |
| **1.5** team-formation |  |  | **L** |  |  |  |  |  |  |  |  |  |  |
| **1.6** rough-mockups | S | **L** |  |  |  |  |  |  |  |  |  | R |  |
| **1.7** approval-handoff | S |  | **L** |  |  |  |  |  |  |  |  |  |  |
| **2.1** reverse-engineering |  |  |  | S |  |  |  | **L** |  |  |  |  |  |
| **2.2** practices-discovery |  |  |  |  |  |  | S | S | S | **L** |  |  |  |
| **2.3** requirements-analysis | **L** |  |  |  |  |  |  |  |  |  |  | R |  |
| **2.4** user-stories | **L** | S |  |  |  |  |  | S | S |  |  | R |  |
| **2.5** refined-mockups | S | **L** |  |  |  |  |  |  |  |  |  | R |  |
| **2.6** domain-design |  | S |  | **L** | S |  |  |  |  |  |  |  | R |
| **2.7** units-generation |  |  | S | **L** |  |  |  |  |  |  |  |  | R |
| **2.8** contract-design |  |  |  | **L** | S |  |  |  |  |  |  |  | R |
| **2.9** delivery-planning |  |  | **L** | S |  |  |  |  |  |  |  |  |  |
| **3.1** functional-design |  |  |  | **L** |  |  |  | S |  |  |  |  | R |
| **3.2** nfr-requirements |  |  |  | **L** |  | S | S |  | S |  |  |  | R |
| **3.3** nfr-design |  |  |  | **L** | S |  |  |  |  |  |  |  | R |
| **3.4** infrastructure-design |  |  |  |  | **L** | S | S |  |  |  |  |  | R |
| **3.5** code-generation |  |  |  |  |  |  |  | **L** |  |  |  |  | R |
| **3.6** build-and-test |  |  |  |  |  |  | S |  | **L** |  |  |  |  |
| **3.7** ci-pipeline |  |  |  |  |  |  |  |  |  | **L** |  |  |  |
| **4.1** deployment-pipeline |  |  |  |  |  |  |  |  |  | **L** |  |  |  |
| **4.2** environment-provisioning |  |  |  |  | **L** | S | S |  |  |  |  |  |  |
| **4.3** deployment-execution |  |  |  |  |  |  |  | S |  | **L** |  |  |  |
| **4.4** observability-setup |  |  |  |  |  |  |  |  |  |  | **L** |  |  |
| **4.5** incident-response |  |  |  |  |  |  |  |  |  |  | **L** |  |  |
| **4.6** performance-validation |  |  |  |  |  |  |  |  | **L** |  |  |  |  |
| **4.7** feedback-optimization |  |  |  |  | S |  |  |  |  |  | **L** |  |  |

Lecturas rápidas: Architect es el agente más cargado (7 leads + 1 link de pipeline + 3 supports); Product acumula todo el negocio de ideation/inception; los reviewers solo firman R; Compliance es el único agente de dominio sin ningún lead (support puro).
