using BinDeps

@BinDeps.setup
libnetcdf = library_dependency("libnetcdf", aliases = ["libnetcdf4","libnetcdf-7,netcdf"])

@windows_only begin
  using Conda
  provides(Conda.Manager, "libnetcdf", libnetcdf)
end

@osx_only begin
  using Homebrew
  provides(Homebrew.HB, "netcdf", libnetcdf, os = :Darwin)
end

provides(AptGet, Dict("libnetcdf-dev"=>libnetcdf), os = :Linux)
provides(Yum, Dict("netcdf-devel"=>libnetcdf), os = :Linux)

@BinDeps.install Dict(:libnetcdf => :libnetcdf)
