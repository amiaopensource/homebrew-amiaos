# typed: true
# frozen_string_literal: true

# Homebrew release formula for grabbags
class Grabbags < Formula
  include Language::Python::Virtualenv
  desc "Enhanced implementation of the Library of Congress's BagIt Library"
  homepage "https://github.com/amiaopensource/grabbags"
  url "https://github.com/amiaopensource/grabbags/archive/refs/tags/0.0.2.tar.gz"
  sha256 "96a528ed13c67b8b9d33ed04b1678e12d1392b6ed08452a5c89ad69c818f93e7"
  head "https://github.com/amiaopensource/grabbags.git"

  depends_on "python@3.9"

  resource "bagit" do
    url "https://files.pythonhosted.org/packages/e5/99/927b704237a1286f1022ea02a2fdfd82d5567cfbca97a4c343e2de7e37c4/bagit-1.8.1.tar.gz"
    sha256 "37df1330d2e8640c8dee8ab6d0073ac701f0614d25f5252f9e05263409cee60c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{libexec}/bin/pip", "check"
    system bin/"grabbags", "--version"
  end
end
