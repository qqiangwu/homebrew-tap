class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "900469bffd3a6237b6c1798d36639d6e83482468d3d72fd3173abc043139e9e7"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "d131908ef28fc6d26460184fd33edc8d65d348067d5e3320ce50dfd3083d2b37"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a17cdf1908ff50879c3b52d975d6f388c317a9ef32cd2f0a72e0c955b9633305"
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
