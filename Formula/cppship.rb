class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e8a16622cf8bbd2234ac7fbf42bdbb21bdaeec50bdc8c9797cea0514a2dbec2a"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "488578148b475416c6d53f8f23157ffe763c6c39d4feb4553f8b53f81fad8215"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "814e273be6be9752a60a357e9f8498c02f078f92a81aae457ca8213b5ff9c0ed"
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
