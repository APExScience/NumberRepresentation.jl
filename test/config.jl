@testset "NumberRepresentationConfig" begin
    # Default constructor
    cfg = NumberRepresentationConfig()
    @test cfg.signSignificand == false
    @test cfg.signExponent == false
    @test cfg.shortenOneTimes == false
    @test cfg.shortenBaseToZero == false
    @test cfg.decimals == 6
    @test cfg.toleranceShort == 1e-8
    @test isa(cfg.decimals, Integer)
    @test isa(cfg.toleranceShort, Real)

    # Keyword overrides
    cfg2 = NumberRepresentationConfig(
        signSignificand = true,
        signExponent = true,
        shortenOneTimes = true,
        shortenBaseToZero = true,
        decimals = 3,
        toleranceShort = 1e-4
    )
    @test cfg2.signSignificand == true
    @test cfg2.signExponent == true
    @test cfg2.shortenOneTimes == true
    @test cfg2.shortenBaseToZero == true
    @test cfg2.decimals == 3
    @test cfg2.toleranceShort == 1e-4
    @test isa(cfg2.decimals, Integer)
    @test isa(cfg2.toleranceShort, Real)

    # Construction from Dict
    d = Dict(
        :signSignificand => true,
        :signExponent => false,
        :shortenOneTimes => true,
        :shortenBaseToZero => false,
        :decimals => 2,
        :toleranceShort => 1e-6
    )
    cfgd = NumberRepresentationConfig(d)
    @test toDict(cfgd) == d

    # Construction from NamedTuple
    nt = (
        signSignificand = false,
        signExponent = true,
        shortenOneTimes = false,
        shortenBaseToZero = true,
        decimals = 4,
        toleranceShort = 2e-5
    )
    cfgn = NumberRepresentationConfig(nt)
    @test cfgn.signSignificand == nt.signSignificand
    @test cfgn.signExponent == nt.signExponent
    @test cfgn.shortenOneTimes == nt.shortenOneTimes
    @test cfgn.shortenBaseToZero == nt.shortenBaseToZero
    @test cfgn.decimals == nt.decimals
    @test cfgn.toleranceShort == nt.toleranceShort

    # Unknown keyword should still construct (warning not asserted here)
    cfg_unknown = NumberRepresentationConfig(unknown = 42)
    @test isa(cfg_unknown, NumberRepresentationConfig)
    # check it falls back to defaults for known fields
    @test cfg_unknown.decimals == 6
    @test cfg_unknown.toleranceShort == 1e-8

    # toDict returns consistent mapping for a sample config
    sample = NumberRepresentationConfig(shortenOneTimes = true, decimals = 5, toleranceShort = 1e-7)
    d_sample = toDict(sample)
    @test d_sample[:shortenOneTimes] == true
    @test d_sample[:decimals] == 5
    @test d_sample[:toleranceShort] == 1e-7
end