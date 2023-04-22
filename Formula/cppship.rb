class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f2851dee352e8eb98786128f1da382448abb9c7206abc31d72257827293a77f1"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "05fc0360e6bd5e2fec6eb544e65ae9a8167f620592049d0b298292de55e7ddd5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e13b96272d5b6243feffeeb5f56f31c5fdfdcefeed6aac62c743ad10e1f02349"
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
