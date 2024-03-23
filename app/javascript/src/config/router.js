import { createWebHistory, createRouter } from "vue-router";
import { routes } from './routes'
import { navGuard as authGuard } from "~/concepts/auth";
import { navGuard as userGuard } from "~/concepts/users";

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach(authGuard)
router.beforeEach(userGuard)

export default router;
