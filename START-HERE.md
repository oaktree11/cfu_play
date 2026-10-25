# CFU-Playground in Codespaces (Renode, no FPGA board)

Follow the
[step-by-step tutorial](https://cfu-playground.readthedocs.io/en/latest/step-by-step.html)
and write your report. The toolchain, Renode and your project are already set up here.

## 1. First thing: get your own copy of the repo

You opened the instructor's template, which you can't push to. Save your work in your own GitHub repo
**before you change anything**.

**Do not use VS Code's "Publish Branch" / "Publish to GitHub" button.** It creates a repo from a snapshot of the
files that loses the submodule links, and the environment then fails to build in any new codespace.

Instead, use **one** of these:

- **Fork (simplest).** Run `git push`. If you are offered a fork, accept. Git then keeps the full history,
  and your work goes to your fork. (Forks of a public repo are public. If that's a problem for you, use the next option.)
- **Your own empty repo.** On github.com create a new **empty** repository (no README; private is fine), then:
  ```bash
  git remote add mine https://github.com/<your-username>/<your-repo>.git
  git push -u mine main
  ```
  If you get a 403, log in first: `unset GITHUB_TOKEN; gh auth login` (choose GitHub.com, HTTPS, browser), then `gh auth setup-git`, and push again.

From then on `git push` goes to your repo (the `-u mine` makes that the default).
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
To continue later, **reopen the same codespace** from github.com/codespaces. Don't create a new one from the template: it won't contain your changes.
Commit and push regularly, **adding only your project**:

```bash
git add proj/my_first_cfu
git commit -m "Describe what you did"
git push
```


  Compare your own baseline run against your own optimised runs, and report the speed-ups.
- Record the commands you ran and the output you saw (copy from the terminal).
