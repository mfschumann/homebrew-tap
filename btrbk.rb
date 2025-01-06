class Btrbk < Formula
  desc "Tool for creating snapshots and remote backups of btrfs subvolumes"
  homepage "https://digint.ch/btrbk/"
  url "https://digint.ch/download/btrbk/releases/btrbk-0.32.6.tar.xz"
  sha256 "02e2ac647c918463202cbe607bb95557a4f7fd237069124333c54da5b2bbb76b"
  license "GPL-3.0-only"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3d96562514b873c1413b085dc73d0c5b3897ad529dd9381138e32e00943a5636"
  end

  depends_on "asciidoctor" => :build
  depends_on "btrfs-progs"
  uses_from_macos "perl"

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", libexec/"lib"

    bin.install name
    bin.env_script_all_files(libexec/"bin", PERL5LIB: ENV["PERL5LIB"])

    pkgetc.install "btrbk.conf.example"

    cd "doc" do
      # ENV.prepend_path "PATH", "#{Formula["asciidoctor"].opt_bin}"
      system "make", "man"
      system "PREFIX=#{prefix} make install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test btrbk`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
