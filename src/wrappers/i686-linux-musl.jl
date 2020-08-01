# Autogenerated wrapper script for ORC_jll for i686-linux-musl
export liborc, liborc_test, orc_bugreport, orcc

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `liborc`
const liborc_splitpath = ["lib", "liborc-0.4.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
liborc_path = ""

# liborc-specific global declaration
# This will be filled out by __init__()
liborc_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const liborc = "liborc-0.4.so.0"


# Relative path to `liborc_test`
const liborc_test_splitpath = ["lib", "liborc-test-0.4.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
liborc_test_path = ""

# liborc_test-specific global declaration
# This will be filled out by __init__()
liborc_test_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const liborc_test = "liborc-test-0.4.so.0"


# Relative path to `orc_bugreport`
const orc_bugreport_splitpath = ["bin", "orc-bugreport"]

# This will be filled out by __init__() for all products, as it must be done at runtime
orc_bugreport_path = ""

# orc_bugreport-specific global declaration
function orc_bugreport(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(orc_bugreport_path)
    end
end


# Relative path to `orcc`
const orcc_splitpath = ["bin", "orcc"]

# This will be filled out by __init__() for all products, as it must be done at runtime
orcc_path = ""

# orcc-specific global declaration
function orcc(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(orcc_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"ORC")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global liborc_path = normpath(joinpath(artifact_dir, liborc_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global liborc_handle = dlopen(liborc_path)
    push!(LIBPATH_list, dirname(liborc_path))

    global liborc_test_path = normpath(joinpath(artifact_dir, liborc_test_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global liborc_test_handle = dlopen(liborc_test_path)
    push!(LIBPATH_list, dirname(liborc_test_path))

    global orc_bugreport_path = normpath(joinpath(artifact_dir, orc_bugreport_splitpath...))

    push!(PATH_list, dirname(orc_bugreport_path))
    global orcc_path = normpath(joinpath(artifact_dir, orcc_splitpath...))

    push!(PATH_list, dirname(orcc_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

