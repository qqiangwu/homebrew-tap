class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "522494f521b46163ab65b90888ff1091acc38feb1b0ea3f39d7be89b1cf3b4ec"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "497ee90e441f7d9f8b1b8e95b827583710f8bdd1610a68a6f61785a1a2925378"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e1b0a5b2568ac841010297e0dc85d0eccb5ca0dce05c1eedfc149b21a479b11e"
    sha256 cellar: :any_skip_relocation, ventura:       "ce1a7e135ad8ecec18b36d11c9b4021ce5f35d0b3689bed63960be5ae45fbb20"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "66d0c3b84d9c96dc00fa5ccfbaaca694821cc63fdadcf2072b6bdc015f9247de"
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
