class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "0306e2ad247322e5d1bbbc84c3030839ee58e89e4128271e2950439aa5d237fc"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "f55a58eb521654453401eeec21cf7868ea73907aa32623940817da5c9f553116"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6e3bf84882da551201138a50014992a0db9439686bcafdbd9264551ea32ba9e2"
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
