class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "44a2a321be96bfbba4b70fe81924e0358664e91616f16c44a03f7115743e7e1a"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "994215c4410a0625d2d768483aa32aae50ee7977f7406d86980ea4730c8a1002"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d474b07f2a2390712e7f01518fc2de049a3a87d63ba7fa1b17dfa148fced6ec0"
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
