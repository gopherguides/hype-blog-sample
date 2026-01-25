# Building a REST API with Go's Standard Library

<details>
slug: go-rest-api
published: 01/20/2026
author: Gopher Guides
seo_description: Learn how to build a complete REST API using only Go's standard library with http.ServeMux, handlers, middleware, and JSON encoding.
tags: go, api, rest, http
</details>

---

<details>
overview: true
</details>

## Overview

Go's standard library provides everything you need to build production-ready REST APIs. In this article, we'll build a complete API using only the `net/http` package, demonstrating handlers, middleware, and JSON encoding.

---

## Setting Up the Server

Let's start with a basic HTTP server structure:

<code src="src/api/main.go"></code>

The `http.ServeMux` in Go 1.22+ supports method-based routing with patterns like `GET /users` and path parameters like `/users/{id}`.

## Creating Handlers

Handlers process incoming requests and return responses. Here's our user handler:

<code src="src/api/handlers.go"></code>

Each handler follows the `http.HandlerFunc` signature, making them easy to test and compose.

## Adding Middleware

Middleware wraps handlers to add cross-cutting concerns like logging and authentication:

<code src="src/api/middleware.go"></code>

The middleware pattern in Go uses function composition - each middleware returns a new handler that wraps the original.

## Key Takeaways

1. **Use the standard library** - Go's `net/http` is production-ready
2. **Leverage Go 1.22+ routing** - Method-based patterns simplify routing
3. **Compose with middleware** - Keep handlers focused on business logic
4. **Return JSON properly** - Always set Content-Type headers

## Next Steps

- Add database persistence with `database/sql`
- Implement request validation
- Add rate limiting middleware
- Set up graceful shutdown
