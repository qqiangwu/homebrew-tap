class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "44a2a321be96bfbba4b70fe81924e0358664e91616f16c44a03f7115743e7e1a"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "440f08b3359cfa802e3a46cc031a2b8678a3af89d0165462b34b0eddfdb06f42"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "521fa9aee3a26582c82c2e6ac35c78156bdf26848b6c98eb33c258a9e142e891"
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
