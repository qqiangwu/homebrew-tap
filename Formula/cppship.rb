class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "173c58b95a2bdedff694367f788236f45e6967a8451853514def0ad0c919eaf1"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "7311b09c371e613ac9c51177d3e978199f7bc10789d0642d3094c9876c71d2d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c4aada6db8087082d81ce6ceb755d8842ddb7ef1815f2313e580d38b92700824"
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
