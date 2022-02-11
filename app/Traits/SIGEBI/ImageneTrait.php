<?php

namespace App\Traits\SIGEBI;

use Illuminate\Support\Facades\Storage;

trait ImageneTrait{

    protected $disk = 'portada';

    // Get Image
    public function getPathImageAttribute(){
        if ( ! is_null($this->filename) ) {
            $exists = Storage::disk($this->disk)->exists($this->filename);
            //dd($this->filename);
            $ret = $exists && ! is_null($this->filename)
                ? "/storage/".$this->disk."/".$this->filename
                : '/images/web/file-not-found.png';
            return $ret;
        }else{
            return $ret ?? '/images/web/file-not-found.png';
        }
    }

    // Get Image Thumbnail
    public function getPathImageThumbAttribute(){
        $fl   = explode('.',$this->filename);
        //dd($this->filename);
        $dg   = $fl[count($fl)-1];
        $envi = config("ibt.videos_type_extension");
        $rt   = in_array( $dg, $envi ) ? '/images/web/video-icon.png':'/images/web/file-not-found.png';
        $exists = Storage::disk($this->disk)->exists($this->filename_thumb);
        $ret = $exists
            ? "/storage/".$this->disk."/".$this->filename_thumb
            : $rt;
        return $ret;
    }



}
