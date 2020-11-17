# LLVM Custom Builds

> Go along your path, this is a dangerous place.

This repository contains a small `build.sh` script that builds
LLVM. The version of LLVM is defined by the `.gitmodules` file. The
build is run by [Github
Actions](https://github.com/Hywan/llvm-custom-builds/actions) on 3
platforms: Linux (Ubuntu), Darwin (macOS), and Windows, all
AMD64. Builds are attached to [Github releases as
assets](https://github.com/Hywan/llvm-custom-builds/releases).

## Branches

This repository comes with 3 branches that map to specific LLVM
branches:

| Branch of this repository… | … maps to LLVM branch |
|-|-|
| `master` | `release/llvm-11.x` |
| `llvm-11.x` | `release/llvm-11.x` |
| `llvm-10.x` | `release/llvm-10.x` |

## Prebuilds

<table>
  <thead>
    <tr>
      <th>LLVM version</th>
      <th>Architecture</th>
      <th>Platform</th>
      <th>Package</th>
      <th>Size</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="3">11</td>
      <td rowspan="3">amd64</td>
      <td>Darwin</td>
      <td><a href="https://github.com/Hywan/llvm-custom-builds/releases/download/11.x/darwin-amd64.tar.gz">download</a></td>
      <td>377Mb</td>
    </tr>
    <tr>
      <td>Linux</td>
      <td><a href="https://github.com/Hywan/llvm-custom-builds/releases/download/11.x/linux-amd64.tar.gz">download</a></td>
      <td>486Mb</td>
    </tr>
    <tr>
      <td>Windows</td>
      <td><a href="https://github.com/Hywan/llvm-custom-builds/releases/download/11.x/windows-amd64.tar.gz">download</a></td>
      <td>619Mb</td>
    </tr>
    <tr>
      <td rowspan="3">10</td>
      <td rowspan="3">amd64</td>
      <td>Darwin</td>
      <td><a href="https://github.com/Hywan/llvm-custom-builds/releases/download/10.x/darwin-amd64.tar.gz">download</a></td>
      <td>353Mb</td>
    </tr>
    <tr>
      <td>Linux</td>
      <td><a href="https://github.com/Hywan/llvm-custom-builds/releases/download/10.x/linux-amd64.tar.gz">download</a></td>
      <td>457Mb</td>
    </tr>
    <tr>
      <td>Windows</td>
      <td><a href="https://github.com/Hywan/llvm-custom-builds/releases/download/10.x/windows-amd64.tar.gz">download</a></td>
      <td>589Mb</td>
    </tr>
  </tbody>
</table>

## LLVM configuration

The following configuration is the one used for all actual prebuilds:

| Options | Value |
|-|-|
| `clang` | enabled |
| `terminfo` | disabled |
| `zlib` | disabled |
| `docs` | not included |
| `examples` | not included |
| `go_tests` | not included |
| `tests` | not included |
| `tools` | included |
| `utils` | not included |
| `optimized_tablegen` | enabled |
| `targets_to_build` | `X86` + `AArch64` |

## License

Do whatever you want. No license. It's free. You're free. I'm not
responsible of what you're doing with that.
