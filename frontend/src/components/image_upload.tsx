"use client"
import {useRef, useState} from "react";
import Image from "next/image";

const Image_upload = ({storeImage}:{storeImage:(value:File)=> void}) => {
    const [selectedImage, setSelectedImage] = useState<File>();
    const fileInputRef = useRef<HTMLInputElement | null>(null);

    const handleImageUpload = (event: React.ChangeEvent<HTMLInputElement>) => {
        if (event?.target?.files[0]) {
            const file = event?.target?.files[0];
            setSelectedImage(file);
            storeImage(file)
        }
    };

    const triggerFileInput = () => {
        if (fileInputRef.current) {
            fileInputRef.current?.click();
        }
    };
  return (
      <>
          <div
              className="w-1/6 h-[150px] border border-black rounded-lg flex justify-center items-center cursor-pointer"
              onClick={triggerFileInput}
          >
              {selectedImage ? (
                  <img
                      src={URL.createObjectURL(selectedImage)}
                      alt="Uploaded"
                      className="object-contain h-full w-full rounded-lg"
                  />
              ) : (
                  <Image src="/plus.svg" alt="add" width={50} height={50}/>
              )}
              <input
                  type="file"
                  className="hidden"
                  ref={fileInputRef}
                  onChange={handleImageUpload}
              />
          </div>
      </>
  )
}
export default Image_upload;