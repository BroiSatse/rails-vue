import Account from './components/Account'
import Verify from './components/Verify'

export const names = {
  verify: 'userVerify',
  account: 'userAccount'
}

export const routes = [
  { path: 'account', component: Account, name: names.account },
  { path: 'verify', component: Verify, name: names.verify, meta: { layout: 'blank' } }
]
