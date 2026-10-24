# CFU-Playground in Codespaces (Renode, no FPGA board)

Follow the
[step-by-step tutorial](https://cfu-playground.readthedocs.io/en/latest/step-by-step.html)
and write your report. The toolchain, Renode and your project are already set up here.

## 1. First thing: publish your own copy

You opened the instructor's template. To save your work, click the **Source Control** icon,
then **Publish Branch** (or "Publish to GitHub") and publish to a **new repository under your own account**.
Do this before you change anything. From then on, commit and push to your own repo.

## 2. Differences from the tutorial

| Tutorial says | Here |
|---|---|
| `cp -r proj/proj_template proj/my_first_cfu` | **Skip it.** `proj/my_first_cfu` already exists and is already built. (Copying again would nest a folder inside it.) |
| `make prog` then `make load` | `make renode-headless` |
| Use the menu: `1`, `1`, `g` | Same keys. After "Redirecting the input to sysbus.uart", **press Enter once** to bring up the menu. |
| Re-run after an edit | Press `ESC`, type `quit`, edit, run `make renode-headless` again |

- Work in `proj/my_first_cfu`:
  ```bash
  cd proj/my_first_cfu
  make renode-headless
  ```
- Amaranth unit tests: `../../scripts/pyrun cfu.py`
- `ESC` leaves the serial console and returns to the Renode `(monitor)`; `quit` there exits.
- The first run is quick because everything is pre-built. Later runs only rebuild what you changed.

## 3. Saving your work

Your code lives in this codespace, which stops when idle and is eventually deleted if unused.
Commit and push regularly, **adding only your project**:

```bash
git add proj/my_first_cfu
git commit -m "Describe what you did"
git push
```

## 4. For your report

- Cycle counts come from Renode's CPU model and may differ from the numbers in the tutorial.
  Compare your own baseline run against your own optimised runs, and report the speed-ups.
- Record the commands you ran and the output you saw (copy from the terminal).
