/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLastWord = function (s) {
  let len = 0;
  let started = false;

  for (let i = s.length - 1; i >= 0; i--) {
    if (s[i] !== " ") started = true;

    if (started) {
      if (s[i] === " ") break;
      len++;
    }
  }

  return len;
};
