class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3c972534464a531fe5e61a63cb2dba7966ab468868d8b942559ed6d32c258254"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "ee83c1d454da56bb34acf5c37db35886e6abc0f10c42f170e0721e836a090e79"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a03ef6c2c813c9cb0156afd8f3b640b82c7736f9a1488b7585a280364dacc522"
  end

  depends_on "cmake"
  depends_on "conan"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin/"cppship"
    system bin/"cppship", "init", "--std=20", "demo"
  end
end
