#
#   Base manifest for the Debian Ada Virtual Machine
#


node default {
    stage { pre: before => Stage[main] }

    class {
        apt :
            stage   => pre;
    }

    package {
        # Compiler
        "ada-compiler"      :
            ensure  => installed;


        # Helpful development utilities
        "gprbuild"          :
            ensure  => installed;
        "libaunit3"         :
            ensure  => installed;
        "libaunit1-dev"     :
            ensure  => installed;
        "adabrowse"         :
            ensure  => installed;


        # Documentation
        "ada-reference-manual-text" :
            ensure  => installed;
        "ada-reference-manual-info" :
            ensure  => installed;


        # Additional libraries
        "libxmlada3.2"      :
            ensure  => installed;
        "libxmlada3.2-dev"  :
            ensure  => installed;
        "libxmlada-doc"     :
            ensure  => installed;

        "libadasockets3"    :
            ensure  => installed;
        "libadasockets3-dev":
            ensure  => installed;

        "liblog4ada0"       :
            ensure  => installed;
        "liblog4ada1-dev"   :
            ensure  => installed;


        # Web Development
        "libaws-bin"        :
            ensure  => installed;
        "libaws-doc"        :
            ensure  => installed;
        "libaws2.7"         :
            ensure  => installed;
        "libaws2.7-dev"     :
            ensure  => installed;


        # Misc helpful utilities
        "gdb"               :
            ensure  => installed;
        "cgdb"              :
            ensure  => installed;
    }

    # include our custom sources.list file
    include apt
}
