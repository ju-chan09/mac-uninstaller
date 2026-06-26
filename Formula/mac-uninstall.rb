class MacUninstall < Formula
  include Language::Python::Virtualenv

  desc "macOS app cleaner for the terminal — remove apps and their leftovers"
  homepage "https://github.com/ju-chan09/mac-uninstall"
  url "https://github.com/ju-chan09/mac-uninstall/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "22705d39ce65c07352d85865010613855f58ae0f96525b121b52224055f3a98d"  # run: brew fetch --build-from-source Formula/mac-uninstall.rb
  license "MIT"
  head "https://github.com/ju-chan09/mac-uninstall.git", branch: "main"

  depends_on "python@3.12"
  depends_on :macos

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources

    libexec.install "uninstall"

    # Wrap the script so it uses the bundled Python and site-packages.
    (bin/"uninstall").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/python3" "#{libexec}/uninstall" "$@"
    EOS
    chmod 0755, bin/"uninstall"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uninstall --version")
  end
end
