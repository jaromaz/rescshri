#!/bin/sh

    # -------------------------------------------------------
    # Preparation of the rescshri Linux mini-distribution
    # 2017 Jaromaz http://jm.iq.pl
    # -------------------------------------------------------

        VERSION='1.2'
        DEMO=0
        CPU=32
        HTTPSERVER='http://jm.iq.pl/rescshri/download'

    # -------------------------------------------------------

    download_unpack () {
        echo "Downloading $CPU-bit version:"
        cd ./download
        wget $HTTPSERVER/rescshri-$VERSION-$CPU-src.tar.gz
        tar zxf rescshri-$VERSION-$CPU-src.tar.gz
        rm rescshri-$VERSION-$CPU-src.tar.gz
        cd ..
    }

    if [ ! -d 'output' ] ; then
        mkdir output
    fi

    for i in $@
    do
        case $i in
            'redownload')
                rm -r download
	        ;;
            'livedemo')
                    DEMO=1
                ;;
                *)
                if [ $i -eq 32 -o $i -eq 64 ] ; then
                    CPU=$i
                fi
	        ;;
        esac 
    done

    if [ ! -d 'download' ] ; then
        mkdir download
    fi
    if [ ! -d "download/$CPU" ] ; then
        download_unpack
    fi

    # Instalation
    rm -r tmp > /dev/null 2>&1
    mkdir tmp
    cp -r download/$CPU/* tmp
    cp -r src/* tmp
    rm -r output > /dev/null 2>&1
    mkdir output
    mv tmp/bzImage output

    # Preparation of live demo version
    if [ $DEMO -eq 1 ] ; then
        mv tmp/usr/share/livedemo/bin/* tmp/usr/bin/
        mv tmp/usr/bin/fdisk tmp/usr/share/livedemo/bin/
        mv tmp/usr/bin/cfdisk tmp/usr/share/livedemo/bin/
        tail +2 tmp/usr/share/livedemo/src/func >> tmp/usr/bin/func
        rm tmp/usr/share/livedemo/src/func
        tail +3 tmp/usr/bin/rescshri >> tmp/usr/share/livedemo/src/rescshri
        mv tmp/usr/share/livedemo/src/* tmp/usr/bin/
    else
        rm -r tmp/usr/share/livedemo
    fi

    # Initrd cpio archive
    cd ./tmp
    find . | cpio --create --format='newc' | gzip > ../output/rescshri.img
    cd ..
    rm -r tmp

    echo "done"

