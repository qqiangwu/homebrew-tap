class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "d7024c73cd519c22b58ff5f0f2bcf59e7b7b3af75ce94f8a87afbd36fca5b483"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "8f48231c6c064582a07459026015ba41fe4f4ac7636fed7df275b6e0cf3f811e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7114de3de7dae8c1ff8d948f6cf81efea577f91b73947fe964717fdc19852482"
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
