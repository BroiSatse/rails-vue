import { createWebHistory, createRouter } from "vue-router";
import { routes } from './routes'
import { navGuard as authGuard } from "~/concepts/auth";

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach(authGuard)

export default router;
