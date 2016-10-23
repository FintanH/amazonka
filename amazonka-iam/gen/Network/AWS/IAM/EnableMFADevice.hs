{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.EnableMFADevice
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Enables the specified MFA device and associates it with the specified IAM user. When enabled, the MFA device is required for every subsequent login by the IAM user associated with the device.
module Network.AWS.IAM.EnableMFADevice
    (
    -- * Creating a Request
      enableMFADevice
    , EnableMFADevice
    -- * Request Lenses
    , emdUserName
    , emdSerialNumber
    , emdAuthenticationCode1
    , emdAuthenticationCode2

    -- * Destructuring the Response
    , enableMFADeviceResponse
    , EnableMFADeviceResponse
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.IAM.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'enableMFADevice' smart constructor.
data EnableMFADevice = EnableMFADevice'
    { _emdUserName            :: !Text
    , _emdSerialNumber        :: !Text
    , _emdAuthenticationCode1 :: !Text
    , _emdAuthenticationCode2 :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'EnableMFADevice' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'emdUserName'
--
-- * 'emdSerialNumber'
--
-- * 'emdAuthenticationCode1'
--
-- * 'emdAuthenticationCode2'
enableMFADevice
    :: Text -- ^ 'emdUserName'
    -> Text -- ^ 'emdSerialNumber'
    -> Text -- ^ 'emdAuthenticationCode1'
    -> Text -- ^ 'emdAuthenticationCode2'
    -> EnableMFADevice
enableMFADevice pUserName_ pSerialNumber_ pAuthenticationCode1_ pAuthenticationCode2_ =
    EnableMFADevice'
    { _emdUserName = pUserName_
    , _emdSerialNumber = pSerialNumber_
    , _emdAuthenticationCode1 = pAuthenticationCode1_
    , _emdAuthenticationCode2 = pAuthenticationCode2_
    }

-- | The name of the IAM user for whom you want to enable the MFA device.
--
-- The <http://wikipedia.org/wiki/regex regex pattern> for this parameter is a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.\'-
emdUserName :: Lens' EnableMFADevice Text
emdUserName = lens _emdUserName (\ s a -> s{_emdUserName = a});

-- | The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial number is the device ARN.
--
-- The <http://wikipedia.org/wiki/regex regex pattern> for this parameter is a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =\/:,.\'-
emdSerialNumber :: Lens' EnableMFADevice Text
emdSerialNumber = lens _emdSerialNumber (\ s a -> s{_emdSerialNumber = a});

-- | An authentication code emitted by the device.
--
-- The format for this parameter is a string of 6 digits.
emdAuthenticationCode1 :: Lens' EnableMFADevice Text
emdAuthenticationCode1 = lens _emdAuthenticationCode1 (\ s a -> s{_emdAuthenticationCode1 = a});

-- | A subsequent authentication code emitted by the device.
--
-- The format for this parameter is a string of 6 digits.
emdAuthenticationCode2 :: Lens' EnableMFADevice Text
emdAuthenticationCode2 = lens _emdAuthenticationCode2 (\ s a -> s{_emdAuthenticationCode2 = a});

instance AWSRequest EnableMFADevice where
        type Rs EnableMFADevice = EnableMFADeviceResponse
        request = postQuery iam
        response = receiveNull EnableMFADeviceResponse'

instance Hashable EnableMFADevice

instance NFData EnableMFADevice

instance ToHeaders EnableMFADevice where
        toHeaders = const mempty

instance ToPath EnableMFADevice where
        toPath = const "/"

instance ToQuery EnableMFADevice where
        toQuery EnableMFADevice'{..}
          = mconcat
              ["Action" =: ("EnableMFADevice" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "UserName" =: _emdUserName,
               "SerialNumber" =: _emdSerialNumber,
               "AuthenticationCode1" =: _emdAuthenticationCode1,
               "AuthenticationCode2" =: _emdAuthenticationCode2]

-- | /See:/ 'enableMFADeviceResponse' smart constructor.
data EnableMFADeviceResponse a =
    EnableMFADeviceResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'EnableMFADeviceResponse' with the minimum fields required to make a request.
--
enableMFADeviceResponse
    :: EnableMFADeviceResponse (a)
enableMFADeviceResponse = EnableMFADeviceResponse'

instance NFData EnableMFADeviceResponse
