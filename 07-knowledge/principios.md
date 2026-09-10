> [Inicio](README) › [Knowledge](07-knowledge/README) › **Principios**

# Principios de la metodología

El documento fundacional de 35 líneas que condensa el porqué del diseño. Reproducimos su arquitectura lógica completa.

## Design principle: small mob, broad agents

AI-DLC se construye sobre el **modelo mob** — un grupo pequeño multifuncional que avanza rápido junto. Los agentes lo replican: en vez de decenas de especialistas estrechos (que recrean cadenas de handoff waterfall), **11 agentes ampliamente capaces** que participan a través de múltiples stages y fases, como un architect o developer real en una sesión mob. Cada agente carga contexto entre etapas porque está presente en todo el ciclo: elimina handoffs, reduce overhead de coordinación, mantiene el proceso ágil.

## Los 7 core principles

1. **User decides, AI executes** — cada decisión material pasa por un approval gate donde el usuario revisa, revisa o sobreescribe.
2. **Adaptive depth** — proyectos simples saltan stages pesados; complejos obtienen cobertura completa. El workflow se adapta.
3. **Traceable artifacts** — cada etapa produce documentos markdown versionados, creando el récord de decisiones completo.
4. **Multi-role expertise** — cada etapa es guiada por personas de agente expertas del dominio.
5. **No emergent behavior** — los agentes siguen protocolos prescritos: menús, mensajes de completion y transiciones estandarizadas.
6. **Questions before assumptions** — ante la duda, preguntar. Respuestas incompletas → malos diseños.
7. **Contradiction detection** — cross-check de respuestas por scope mismatches, risk mismatches y conflictos de tecnología.

## Five-phase structure (tabla original)

| Fase | Propósito | Outcome |
|---|---|---|
| **INITIALIZATION** | Bootstrap — state, scaffold, scan, routing | Workspace configurado y listo |
| **IDEATION** | Validar la iniciativa — intent, mercado, viabilidad, scope, equipo | Initiative brief aprobado |
| **INCEPTION** | Elaborar — requirements, stories, diseño, arquitectura, units, plan | Plan de ejecución detallado |
| **CONSTRUCTION** | Build — functional design, NFRs, infra, código, tests, CI | Código funcionando y testeado |
| **OPERATION** | Deploy & operate — pipelines, entornos, observabilidad, incidentes, feedback | Sistema en producción con monitoreo |

## Scope system

No toda tarea requiere cada etapa: los scopes determinan qué stages ejecutan y a qué depth (ver la [matriz de scopes](05-scopes/README)).

## Self-learning guardrails

Cuando un humano corrige el comportamiento de un agente, la corrección se vuelve **guardrail permanente** para que el error no se repita: se clasifica como organization-level (todos los proyectos) o project-level (este repo). Nota v2: el widen-to-org fue eliminado — el learning vive en project.md (default) o team.md (promoción explícita); el tier org es read-only del framework.
