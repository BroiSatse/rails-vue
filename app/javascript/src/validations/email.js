const emailRegexp = /^[^@\s]+@[^@\s]+$/

export default function emailRule ({ msg, allowBlank } = { allowBlank: false }) {
  msg = msg || "invalid email address"

  return function (value) {
    if (allowBlank && [null, undefined, ''].indexOf(value) >= 0) {
      return true
    }

    return emailRegexp.test(value) || msg
  }
}
