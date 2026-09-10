> [Inicio](README) › [Scopes](05-scopes/README) › **express**


# Scope `express`

> La corrida más ligera (responde al pedido de la comunidad): línea recta de requirements a código, test y deploy, sin design pass y sin reviewers (review_cap: none). El swarm es estructuralmente inalcanzable porque salta Units Generation (sin DAG no hay swarm).


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Minimal** |
| test strategy | **(hereda depth: Minimal)** |
| review_cap | **none** |
| walking skeleton | **off** |
| keywords | express, lightweight |
| etapas que ejecuta | **10 de 33** |

**Depth Minimal:** 2-4 preguntas por etapa; artefactos mínimos; análisis breve. Testing: modelo Nyquist, 1 test verificable por requisito + happy-path floor por componente (~5-15 tests).

## Por qué ejecuta y salta esas etapas

Requirements Analysis establece el contrato, Code Generation lo implementa, Build and Test lo verifica, y la cola de deployment puede desplegar y observar. El testing Minimal exige unit tests requirement-driven con happy-path floor por componente. Reverse Engineering queda CONDITIONAL para entender código existente; la cola de deploy se auto-salta si no hay nada que desplegar.

## Cuándo usarlo y cómo promociona

**Uso:** Herramientas internas, scripts, proyectos personales, donde el gate humano por etapa pesa más que el riesgo.

**Promoción:** Sube a feature si el resultado requiere mantenimiento real.

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | — | 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 |
| **Fase 2 · Inception** | 2.1, 2.3 | 2.2, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 |
| **Fase 3 · Construction** | 3.5, 3.6 | 3.1, 3.2, 3.3, 3.4, 3.7 |
| **Fase 4 · Operation** | 4.1, 4.3, 4.4 | 4.2, 4.5, 4.6, 4.7 |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
