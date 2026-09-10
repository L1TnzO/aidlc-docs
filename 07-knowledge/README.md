> [Inicio](README) › **Knowledge**

# 07 · La base de conocimiento (two-tier)

AI-DLC separa el conocimiento en **dos niveles**: la metodología (ships con el framework, ~59 docs) y el conocimiento del equipo (user-managed, en el space). El orden de carga §5 los encadena: memoria del space → shared del framework → knowledge del agente → team shared → team del agente → artefactos previos.

## El catálogo por agente (59 docs)

| Agente | Docs | Temas |
|---|---|---|
| [Architect](03-agentes/aidlc-architect-agent) | 6 | architecture-guide/patterns, ddd-patterns, adr-template, nfr-design-guide/patterns |
| [Developer](03-agentes/aidlc-developer-agent) | 6 | code-generation-guide/patterns, code-analysis, api-design, data-modelling, re-artifacts |
| [Product](03-agentes/aidlc-product-agent) | 7 | product-guide, requirements-guide/elicitation, user-story-patterns, market-research-methods, prioritization-frameworks, functional-design-guide |
| [Design](03-agentes/aidlc-design-agent) | 5 | ux-guide, wireframing-guide, interaction-design-patterns, component-spec-template, accessibility-wcag |
| [Quality](03-agentes/aidlc-quality-agent) | 4 | testing-guide, test-strategy-patterns, nfr-validation-methods, nfr-reliability-guide |
| [DevSecOps](03-agentes/aidlc-devsecops-agent) | 4 | security-guide, threat-modelling-stride, devsecops-pipeline-patterns, nfr-requirements-guide |
| [Operations](03-agentes/aidlc-operations-agent) | 4 | observability-patterns, slo-sli-patterns, incident-response-guide, nfr-performance-guide |
| [AWS Platform](03-agentes/aidlc-aws-platform-agent) | 4 | infrastructure-guide, cdk-best-practices, well-architected-framework, cost-optimization-patterns |
| [Pipeline & Deploy](03-agentes/aidlc-pipeline-deploy-agent) | 3 | cicd-patterns, branching-strategies, deployment-strategies |
| [Delivery](03-agentes/aidlc-delivery-agent) | 3 | workflow-planning-guide, mob-programming-guide, team-topologies |
| **shared** | 8 | ai-dlc-principles, verification, brownfield, state/memory templates, audit-format, rules-reading, knowledge-readme-template |
| Reviewers (2) + Compliance + Composer | 3 | reviewing ×2, regulatory-frameworks, composing |

## Páginas destacadas de esta área

| Página | Contenido |
|---|---|
| [Principios de la metodología](07-knowledge/principios) | Los 7 principios + mob model + five-phase (ai-dlc-principles.md) |
| [Verificación y trazabilidad](07-knowledge/verificacion) | IDs estables FR/US/AC/U/BR, coverage statuses, boundaries (verification.md) |
| [Safeguards brownfield](07-knowledge/brownfield-safeguards) | Blast radius, diff preview, test baseline/validación, rollback (brownfield.md) |

## Cómo se extiende (sin tocar el framework)

- **Knowledge de equipo**: `aidlc/spaces/<space>/knowledge/aidlc-<agente>/...` — mismo path-shape, otro tier; el loader lo encadena tras el del framework.
- **Templates de artefacto**: `spaces/<space>/memory/templates/X.md` — override team del formato de un artefacto (required-sections chequea la MISMA resolución).
- **DocumentKB**: documentos del cliente (PDF/Word) vía `/aidlc knowledge onboard <path>` → doc id → legibles por las etapas (eventos DOCUMENT_INDEXED).

## El punto fino: knowledge-loading es PATH-loading

Hasta que la capa de retrieval se encuentre disponible, el knowledge es path-loaded: el conductor lee los archivos listados (inline) o el harness los carga (dispatch). Un path listado indica ubicación; el contenido se considera entregado tras su lectura y espera del resultado, de forma bloqueante antes de cualquier trabajo de la etapa.
