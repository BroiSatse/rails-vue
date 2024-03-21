export default function presenceRule ({ msg } = {}) {
  msg = msg || "required"

  return function (value) {
    return [null, undefined, ''].indexOf(value) < 0 || msg
  }
}
