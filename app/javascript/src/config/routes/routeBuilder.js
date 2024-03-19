import { RouterView } from 'vue-router'

export default class RouteBuilder {
  constructor() {
    this.routes = []
    this.routeNames = {}
  }

  addConcept(name, { path, routes, names, meta }) {
    path = path || `/${name}`
    const route = { path, children: routes, component: RouterView }
    if (meta) {
      route.meta = meta
    }
    this.routes.push(route)

    this.routeNames[name] = names
  }

  redirect({from, to, as}) {
    this.routes.push({ path: from, redirect: to, name: as })

    if (as) {
      this.routeNames[as] = as
    }
  }
}
