import RouteBuilder from "./routeBuilder.js";
import * as auth from '~/concepts/auth/routes'
import * as dash from '~/concepts/dash/routes'

const builder = new RouteBuilder()

builder.addConcept('auth', { routes: auth.routes, names: auth.names, meta: { layout: 'blank', auth: false } })
builder.addConcept('dash', { routes: dash.routes, path: '/dashboard', names: dash.names })
builder.redirect({ from: '/', to: '/dashboard', as: 'root' })

export const routes =  builder.routes
export const names = builder.routeNames
