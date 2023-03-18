const div = document.getElementById("res");
const input = document.getElementById("input");

const number_to_word = {
  3: "fizz",
  5: "buzz",
  15: "fizzbuzz",
};

async function init() {
  const response = await fetch("./out/main.wasm");
  const bytes = await response.arrayBuffer();
  const wasmModule = await WebAssembly.instantiate(bytes);
  const { fizzbuzz } = wasmModule.instance.exports;

  input.addEventListener("input", (e) => {
    const value = e.target.value;
    div.innerHTML = "";
    for (let i = 1; i <= value; i++) {
      const res = fizzbuzz(i);
      const span = document.createElement("p");
      span.innerText = number_to_word[res] ?? res;
      div.appendChild(span);
    }
  });
}

init();
