# typed: true
# frozen_string_literal: true

class Qctparse < Formula
  include Language::Python::Virtualenv
  desc "Scripts for automating analysis of QCTools reports"
  homepage "https://github.com/amiaopensource/qct-parse"
  url "https://github.com/amiaopensource/qct-parse/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "6ffa13bb71072038f7c708f57768a21ef8b93fdbdf8f51b6551c39bd0cb880c3"
  head "https://github.com/amiaopensource/qct-parse.git"

  depends_on "python@3.11"
  depends_on "ffmpeg"

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/e7/6b/20c3a4b24751377aaa6307eb230b66701024012c29dd374999cc92983269/lxml-5.3.0.tar.gz"
    sha256 "4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f"
  end
  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/qct-parse", "--help"
    system "#{bin}/overcatch", "--help"
    system "#{bin}/makeqctoolsreport", "--help"
  end
end
