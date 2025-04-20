class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "1ce67b573c33bc78de212ff644f891694314dfd5e30db85856b9595d8f1221fb"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "620ab52ab348dbaa4f2d4bb1ee1a26dfba03d005bc496a6fa680a1952ea629e3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cfae6335c805ff107d1288b31cce7dffc73767277265b0b5d2e909b291a8d63c"
    sha256 cellar: :any_skip_relocation, ventura:       "05de64623b1d9e4204a32d62842759a65ccf5a3d38b34fd115d47a0a807deeb3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "60c02f3db2be218079107ab9dfc3b0cc6f2611e2c4f80ea69c0b19b6f343e6ea"
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
