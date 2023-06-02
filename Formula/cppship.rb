class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "20d5b27ca25b9c2c8fb6e324549e540a12e2beeb854b2ede820d89536852554c"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "5fafe2449ef5853a049a9c2de9888bb3e755bed566fb6cc569220c0f5d2b011d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e741b4998be174b7a59a0cbe3a33114a9a868135aa6077d7a942b00e9e38af1c"
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
