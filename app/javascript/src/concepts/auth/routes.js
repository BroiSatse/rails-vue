import SignIn from './components/SignIn.vue'

export const names = {
  signIn: 'authSignIn'
}

export const routes = [
  { path: 'sign-in', component: SignIn, name: names.signIn }
]
